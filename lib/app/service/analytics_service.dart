import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AnalyticsService extends GetxService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  void logEvent({required String event, Map<String, Object>? data}) {
    if (kDebugMode) {
    } else {
      _analytics.logEvent(name: event, parameters: data);
    }
  }
}
