import 'package:ProjectTemplate/services/navigator/app_navigator.dart';
import 'package:ProjectTemplate/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:ProjectTemplate/appLog.dart';

abstract class IRoute {
  void pop();
}

@Singleton(as: IRoute)
class AppRoute implements IRoute {
  final appNavigator = getIt<AppNavigator>();
  @override
  void pop() {
    appNavigator.pop();
  }
}
