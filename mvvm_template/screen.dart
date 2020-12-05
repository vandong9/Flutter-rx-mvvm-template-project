import 'package:ProjectTemplate/common/widget/app_bar.dart';
import 'package:ProjectTemplate/common/widget/loading.dart';
import 'package:ProjectTemplate/common/widget/offline_widget.dart';
import 'package:ProjectTemplate/core/base/i_base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ProjectTemplate/injection.dart';
import 'package:ProjectTemplate/routes.dart';
import 'package:ProjectTemplate/extensions/widget_extension.dart';
import 'package:ProjectTemplate/extensions/string_extension.dart';
import 'repository.dart';
import 'view_model.dart';

class TemplateScreen extends BaseWidget {
  final TemplateViewModel templateViewModel;

  TemplateScreen(this.templateViewModel) {
    // TemplateViewModel(TemplateRepositoryImpl(), getIt<IRoute>());
  }

  @override
  _TemplateScreenState createState() =>
      _TemplateScreenState(templateViewModel: templateViewModel);
}

class _TemplateScreenState extends BaseState<TemplateScreen> {
  /// Properties
  TemplateViewModel _templateViewModel;

  _TemplateScreenState({@required TemplateViewModel templateViewModel}) {
    _templateViewModel = templateViewModel;
  }

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
    _templateViewModel.dispose();
    super.dispose();
  }

  /// Actions
  void _onTouchBack() {
    _templateViewModel.input.popBackTrigger.add(null);
  }

  /// Public

  /// Private

  @override
  Widget build(Object context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                AppNavBar(
                  leftButtonType: LeftButtonType.back,
                  titleText: "Budget".localized(),
                  onTouchBackButton: _onTouchBack,
                ),
                Container(
                  child: Text("Template Page"),
                ),
              ],
            ),
            StreamBuilder(
              stream: _templateViewModel.output.loading.stream,
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
              stream: _templateViewModel.output.offline.stream,
              builder: (context, snapShot) {
                if (snapShot?.data is bool) {
                  if (snapShot?.data == true) {
                    return OfflineWidget();
                  }
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
