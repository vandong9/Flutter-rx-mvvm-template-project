import 'dart:async';

import 'package:ProjectTemplate/appLog.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'app_page_router.dart';
import 'bottomsheet.dart';
import 'dialog/dialog_route.dart';
import 'snack_bar/snack_route.dart';

class Routing {
  String current;
  String previous;
  Object args;
  String removed;
  Route<dynamic> route;
  bool isBack;
  bool isSnackbar;
  bool isBottomSheet;
  bool isDialog;

  // TODO: need check crash when using StreamController despite BehaviorSubject (in HomeScreen)
  final BehaviorSubject<Routing> _controller = BehaviorSubject<Routing>();
  Stream<Routing> get streamRouting => _controller.stream;

  Routing({
    this.current = '',
    this.previous = '',
    this.args,
    this.removed = '',
    this.route,
    this.isBack,
    this.isSnackbar,
    this.isBottomSheet,
    this.isDialog,
  });

  void update(void fn(Routing value)) {
    fn(this);
    _controller.add(this);
  }
}

class AppNavigatorObserver extends NavigatorObserver {
  bool isGetPageRoute = false;
  bool isSnackbar = false;
  bool isDialog = false;
  bool isBottomSheet = false;
  String routeName = "";
  final Routing _routing;

  AppNavigatorObserver(this._routing);

  String name(Route<dynamic> route) {
    if (route?.settings?.name != null) {
      return route?.settings?.name;
    } else if (route is AppPageRoute) {
      return route.routeName;
    } else if (route is AppDialogRoute) {
      return route.settings.name;
    } else if (route is AppModalBottomSheetRoute) {
      return route.settings.name;
    } else {
      return route?.settings?.name;
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    var isGetPageRoute = route is AppPageRoute;
    var isSnackbar = route is SnackRoute;
    var isDialog = route is AppDialogRoute;
    var isBottomSheet = route is AppModalBottomSheetRoute;
    var routeName = name(route);

    if (isSnackbar) {
      AppLog.d("OPEN SNACKBAR $routeName");
    } else if (isBottomSheet) {
      AppLog.d("OPEN $routeName");
    } else if (isDialog) {
      AppLog.d("OPEN $routeName");
    } else if (isGetPageRoute) {
      AppLog.d("GOING TO ROUTE $routeName");
    }

    _routing.update((value) {
      if (route is PageRoute) value.current = routeName;
      value.args = route?.settings?.arguments;
      value.route = route;
      value.isBack = false;
      value.removed = '';
      value.previous = previousRoute?.settings?.name ?? '';
      value.isSnackbar = isSnackbar;
      value.isBottomSheet = isBottomSheet;
      value.isDialog = isDialog;
    });
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);

    var isGetPageRoute = route is AppPageRoute;
    var isSnackbar = route is SnackRoute;
    var isDialog = route is AppDialogRoute;
    var isBottomSheet = route is AppModalBottomSheetRoute;
    var routeName = name(route);

    if (isSnackbar) {
      AppLog.d("CLOSE SNACKBAR $routeName");
    } else if (isBottomSheet) {
      AppLog.d("CLOSE $routeName");
    } else if (isDialog) {
      AppLog.d("CLOSE $routeName");
    } else if (isGetPageRoute) {
      AppLog.d("CLOSE TO ROUTE $routeName");
    }

    _routing.update((value) {
      if (previousRoute is AppPageRoute) {
        value.current = previousRoute.routeName ?? '';
      } else if (previousRoute is PageRoute) {
        value.current = previousRoute?.settings?.name ?? '';
      }
      value.args = route?.settings?.arguments;
      value.route = previousRoute;
      value.isBack = true;
      value.removed = '';
      value.previous = route?.settings?.name ?? '';
      value.isSnackbar = false;
      value.isBottomSheet = false;
      value.isDialog = false;
    });
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    AppLog.d("REPLACE ROUTE ${oldRoute?.settings?.name}");
    AppLog.d("NEW ROUTE ${newRoute?.settings?.name}");

    _routing.update((value) {
      if (newRoute is PageRoute) value.current = newRoute?.settings?.name ?? '';
      value.args = newRoute?.settings?.arguments;
      value.route = newRoute;
      value.isBack = false;
      value.removed = '';
      value.previous = '${oldRoute?.settings?.name}';
      value.isSnackbar = false;
      value.isBottomSheet = false;
      value.isDialog = false;
    });
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
    AppLog.d("REMOVING ROUTE ${route?.settings?.name}");

    _routing.update((value) {
      value.route = previousRoute;
      value.isBack = false;
      value.removed = route?.settings?.name ?? '';
      value.previous = route?.settings?.name ?? '';
    });
  }
}
