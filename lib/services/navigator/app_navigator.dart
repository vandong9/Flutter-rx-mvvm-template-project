import 'package:ProjectTemplate/res/define.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import 'app_page_router.dart';
import 'navigator_observer.dart';
import 'trasition_animation.dart';

class BaseArgument {}

final GlobalKey<NavigatorState> appNavigatorStateKey =
    GlobalKey<NavigatorState>();
List<int> _keys = [];

// TODO: handle feature push and pop Navigator

@singleton
class AppNavigator {
  //// Push
  Routing routing = Routing();
  String currentRouteName = "";

  pushNavigator(Navigator navigator, UniqueKey withKey,
      {Transition transition = Transition.native,
      BaseArgument arguments,
      bool opaque = false,
      bool fullscreenDialog = false}) {
    String routename = "/${navigator.runtimeType.toString()}";

    final route = AppPageRoute(
      opaque: opaque ?? true,
      page: () => navigator,
      routeName: routename,
      settings: RouteSettings(
        arguments: arguments,
      ),
      transition: transition,
      fullscreenDialog: fullscreenDialog,
      transitionDuration: defaultDurationTransition,
    );
    appNavigatorStateKey.currentState.push(route);
  }

  popCurrentNav(BuildContext context) {
    Navigator.of(context).popUntil((route) => true);
  }

  Future<T> push<T>(Widget widget,
      {Transition transition = Transition.native,
      BaseArgument arguments,
      bool opaque = false,
      bool fullscreenDialog = false}) {
    String routename = "/${widget.runtimeType.toString()}";
    final route = AppPageRoute<T>(
      opaque: opaque ?? true,
      page: () => widget,
      routeName: routename,
      settings: RouteSettings(
        arguments: arguments,
      ),
      transition: transition,
      fullscreenDialog: fullscreenDialog,
      transitionDuration: defaultDurationTransition,
    );

    return appNavigatorStateKey.currentState.push(route);
  }

  static void pushName(
    String name, {
    BaseArgument arguments,
  }) {
    appNavigatorStateKey.currentState.pushNamed(name, arguments: arguments);
  }

  void pushReplacementNamed(
    String name, {
    BaseArgument arguments,
  }) {
    appNavigatorStateKey.currentState
        .pushReplacementNamed(name, arguments: arguments);
  }

  void pushAndReplace(Widget widget,
      {Transition transition = Transition.native,
      BaseArgument arguments,
      bool opaque = false,
      bool isFullscreenDialog = false}) {
    String routename = "/${widget.runtimeType.toString()}";
    final route = AppPageRoute(
      opaque: opaque ?? true,
      page: () => widget,
      routeName: routename,
      settings: RouteSettings(
        arguments: arguments,
      ),
      transition: transition,
      fullscreenDialog: isFullscreenDialog,
      transitionDuration: defaultDurationTransition,
    );

    appNavigatorStateKey.currentState.pushReplacement(route);
  }

  void popUntilAndPush(Widget widget, RoutePredicate predicate,
      {Transition transition = Transition.native,
      BaseArgument arguments,
      bool opaque = false,
      bool isFullscreenDialog = false}) {
    String routename = "/${widget.runtimeType.toString()}";
    final route = AppPageRoute(
      opaque: opaque ?? true,
      page: () => widget,
      routeName: routename,
      settings: RouteSettings(
        arguments: arguments,
      ),
      transition: transition,
      fullscreenDialog: isFullscreenDialog,
      transitionDuration: defaultDurationTransition,
    );

    appNavigatorStateKey.currentState.pushAndRemoveUntil(route, predicate);
  }

  Future<T> pushRoute<T>(Route<T> route) {
    return appNavigatorStateKey.currentState.push(route);
  }

  /// Pop
  void pop({bool force = false}) {
    if (force) {
      appNavigatorStateKey.currentState.canPop();
      return;
    }
    if (appNavigatorStateKey.currentState.canPop()) {
      appNavigatorStateKey.currentState.pop();
    }
  }

/*
 * Pop all to App Root page 
 */
  void popToCurrentNavigatorRoot() {
    appNavigatorStateKey.currentState
        .popUntil((route) => appNavigatorStateKey.currentState.canPop());
  }

  void popTopNavigator() {
    Navigator.of(routing.route.navigator.context)
        .popUntil((route) => route.isFirst == false);
    Navigator.of(routing.route.navigator.context, rootNavigator: true).pop();
  }

/*
 * Pop to route of current Navigator
 */
  void popToRootOfCurrentNavigator() {
    appNavigatorStateKey.currentState.popUntil((route) {
      return route.isFirst == true;
    });
  }
}
