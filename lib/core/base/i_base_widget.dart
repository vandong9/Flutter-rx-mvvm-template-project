import 'package:ProjectTemplate/appLog.dart';
import 'package:ProjectTemplate/injection.dart';
import 'package:ProjectTemplate/services/firebase/firebase_analytics.dart';
import 'package:flutter/widgets.dart';

abstract class BaseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState();
}

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final AnalyticsService analyticsService = getIt<AnalyticsService>();

  @override
  void initState() {
    super.initState();
    analyticsService.sendScreenView(widget.runtimeType.toString());
  }

  @override
  Widget build(BuildContext context);
}
