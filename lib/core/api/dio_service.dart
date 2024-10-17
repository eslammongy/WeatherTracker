import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:weather_tracker/core/utils/internet_checker_service.dart';

class DioService {
  final Dio dio;
  bool _isRetrying = false; // To avoid retrying multiple times
  static final List<Function> _pendingRequestsQueue =
      []; // Queue for pending requests

  DioService({required this.dio}) {
    _initializeInterceptors();
    _listenToConnectivityChanges();
  }

  void _initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.type == DioExceptionType.connectionError) {
            debugPrint(
                'No internet connection, request will be retried when online.');
            // _pendingRequestsQueue
            //     .add(() => _retryRequest(error.requestOptions)); // Add to queue
            // return; // Don't propagate the error, we'll retry later
          }
          handler.next(error);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          handler.next(response);
        },
      ),
    );
  }
  //
  // Future<void> _retryRequest(RequestOptions requestOptions) async {
  //   try {
  //     debugPrint('Retrying request: ${requestOptions.uri}');
  //     Response response = await dio.request(
  //       requestOptions.path,
  //       options: Options(
  //         method: requestOptions.method,
  //         headers: requestOptions.headers,
  //       ),
  //       data: requestOptions.data,
  //       queryParameters: requestOptions.queryParameters,
  //     );
  //     debugPrint('Request successful: ${response.data}');
  //   } catch (e) {
  //     debugPrint('Failed to retry request: $e');
  //   }
  // }

  void _listenToConnectivityChanges() {
    InternetConnectivityChecker.startListening(
      initSubscription: (subscription) {
        subscription ??= InternetConnection().onStatusChange.listen((status) {
          bool hasConnection = status == InternetStatus.connected;
          InternetConnectivityChecker.hasConnection = hasConnection;
          if (hasConnection &&
              _pendingRequestsQueue.isNotEmpty &&
              !_isRetrying) {
            // If internet connection is back and there's a pending request
            _retryPendingRequests();
          }
        });
      },
    );
  }

  Future<void> _retryPendingRequests() async {
    _isRetrying = true;
    while (_pendingRequestsQueue.isNotEmpty) {
      final request = _pendingRequestsQueue
          .removeAt(0); // Get the first request in the queue
      await request(); // Retry the request
    }
    _isRetrying = false; // Reset retry flag after all retries
  }

  // To be used in BLoC, add a failed event (which triggers API call) to the queue
  static void addEventToRetryQueue(Function eventFunction) {
    _pendingRequestsQueue.add(eventFunction);
  }
}
