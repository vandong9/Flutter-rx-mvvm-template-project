import 'package:ProjectTemplate/common/widget/loading.dart';
import 'package:ProjectTemplate/modules/splash/splash_screen.dart';
import 'package:ProjectTemplate/services/navigator/app_navigator.dart';
import 'package:ProjectTemplate/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'services/navigator/navigator_observer.dart';

import 'package:firebase_core/firebase_core.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool _initialized = false;
  bool _error = false;

  /// Life cycle
  @override
  void initState() {
    initializeFlutterFire();

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (AppLifecycleState.resumed == state) {

    }
  }

  /// Private

// Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    final navigator = getIt<AppNavigator>();
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    // Show error message if initialization failed
    if (_error) {
      print("fail to initial FlutterFire ${_error.toString()}");
      return Container();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Loading();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Template',
      navigatorKey: appNavigatorStateKey,
      navigatorObservers: [AppNavigatorObserver(navigator.routing)],
      home: SplashScreen(),
    );
  }
}
