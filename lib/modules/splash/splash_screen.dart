import 'package:ProjectTemplate/common/widget/loading.dart';
import 'package:ProjectTemplate/common/widget/offline_widget.dart';
import 'package:ProjectTemplate/core/base/i_base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ProjectTemplate/injection.dart';
import 'package:ProjectTemplate/routes.dart';
import 'splash_repository.dart';
import 'splash_view_model.dart';

class SplashScreen extends BaseWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  /// Properties
  final SplashViewModel _splashViewModel =
      SplashViewModel(SplashRepositoryImpl(), getIt<IRoute>());

  /// Life Cycle
  @override
  void initState() {
    // Get pass argument
    super.initState();

    // Binding input

    // Binding output
  }

  @override
  void dispose() {
    _splashViewModel.dispose();
    super.dispose();
  }

  /// Actions

  /// Public

  /// Private

  @override
  Widget build(Object context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Text("Sample Page"),
            ),
            StreamBuilder(
              stream: _splashViewModel.output.loading.stream,
              builder: (context, snapShot) {
                if (snapShot != null) {
                  if (snapShot.data is bool) {
                    if ((snapShot.data as bool) == true) {
                      return Loading(); // Replace with Loading widget
                    }
                  }
                }
                return Container();
              },
            ),
            StreamBuilder(
              stream: _splashViewModel.output.offline.stream,
              builder: (context, snapShot) {
                if (snapShot?.data is bool) {
                  if (snapShot?.data == true) {
                    return OfflineWidget();
                  }
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
