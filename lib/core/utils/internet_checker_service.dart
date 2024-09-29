import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectivityChecker {
  static final InternetConnectivityChecker _instance =
      InternetConnectivityChecker._internal();
  static bool hasConnection = false;
  static StreamSubscription<InternetStatus>? subscription;

  InternetConnectivityChecker._internal() {
    checkInitialConnection();
  }

  factory InternetConnectivityChecker.init() {
    return _instance;
  }

  checkInitialConnection() async => hasConnection =
      await InternetConnection().internetStatus == InternetStatus.connected;

  static void startListening({
    required Function(
      StreamSubscription<InternetStatus>? subscription,
    ) initSubscription,
  }) async {
    initSubscription(subscription);
    // Lifecycle management for pausing and resuming the subscription
    AppLifecycleListener(
      onResume: () => subscription?.resume(),
      onHide: () => subscription?.pause(),
      onPause: () => subscription?.pause(),
    );
  }

  static void dispose() {
    // Cancel subscription when it's no longer needed
    subscription?.cancel();
    subscription = null;
  }
}

class AppLifecycleListener extends WidgetsBindingObserver {
  final VoidCallback onResume;
  final VoidCallback onPause;
  final VoidCallback onHide;

  AppLifecycleListener({
    required this.onResume,
    required this.onPause,
    required this.onHide,
  }) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResume();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        onPause();
        break;
      case AppLifecycleState.detached:
        onHide();
        break;
      default:
        break;
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
