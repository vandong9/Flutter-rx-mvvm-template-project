import 'package:ProjectTemplate/appLog.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  void sendScreenView(String screenName) {
    if (screenName != null) {
      _analytics.setCurrentScreen(screenName: screenName).catchError(
        (Object error) {
          AppLog.e('$AnalyticsService: $error');
        },
        test: (Object error) => error is PlatformException,
      );
    }
  }
}
