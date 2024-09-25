import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetChecker {
  static final InternetChecker _instance = InternetChecker._internal();
  static bool hasConnection = false;
  late final StreamSubscription<InternetStatus>? _subscription;

  InternetChecker._internal() {
    // Listen to status changes and update the connection status.
    if (_subscription == null) {
      _subscription = InternetConnection().onStatusChange.listen((status) {
        hasConnection = status == InternetStatus.connected;
      });
      AppLifecycleListener(
        onResume: _subscription!.resume,
        onHide: _subscription.pause,
        onPause: _subscription.pause,
      );
    }
  }

  factory InternetChecker.init() {
    return _instance;
  }
}
