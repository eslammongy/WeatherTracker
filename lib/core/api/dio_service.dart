import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:weather_tracker/core/utils/internet_checker_service.dart';

abstract class DioClient {
  static final List<Function> _requestQueue = [];

  static void addInterceptors({required Dio client}) {
    client.interceptors.add(_buildInterceptorWrapper(client));
    // Listen to connectivity changes
    InternetConnectivityChecker.startListening(
      initSubscription: (subscription) {
        // Only start listening if not already subscribed
        subscription ??= InternetConnection().onStatusChange.listen((status) {
          InternetConnectivityChecker.hasConnection =
              status == InternetStatus.connected;
          _connectionChangeListener(InternetConnectivityChecker.hasConnection);
        });
      },
    );
  }

  static InterceptorsWrapper _buildInterceptorWrapper(Dio client) =>
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final isPaused = InternetConnectivityChecker.subscription == null;
          if (!InternetConnectivityChecker.hasConnection && !isPaused) {
            _requestQueue.add(
              () => client.fetch(options),
            ); // Queue the failed requests
            handler.reject(
              DioException(
                requestOptions: options,
                error: 'No internet connection',
                type: DioExceptionType.cancel,
              ),
            );
          } else {
            handler.next(options); // Continue with the request
          }
        },
      );
  // Handle internet connection changes
  static void _connectionChangeListener(bool hasNoneConnection) {
    if (hasNoneConnection) {
      // Re-send all queued requests
      for (var request in _requestQueue) {
        request();
      }
      _requestQueue.clear();
    }
  }
}
