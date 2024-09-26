import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetChecker {
  static final InternetChecker _instance = InternetChecker._internal();
  static bool hasConnection = false;
  static StreamSubscription<InternetStatus>? _subscription;

  InternetChecker._internal() {
    _startListening();
  }

  factory InternetChecker.init() {
    return _instance;
  }

  void _startListening() {
    // Only start listening if not already subscribed
    _subscription ??= InternetConnection().onStatusChange.listen((status) {
      hasConnection = status == InternetStatus.connected;
    });

    // Lifecycle management for pausing and resuming the subscription
    AppLifecycleListener(
      onResume: () => _subscription?.resume(),
      onHide: () => _subscription?.pause(),
      onPause: () => _subscription?.pause(),
    );
  }

  static void dispose() {
    // Cancel subscription when it's no longer needed
    _subscription?.cancel();
    _subscription = null;
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
