import 'package:ProjectTemplate/injection.dart';
import 'package:ProjectTemplate/res/error_mapping.dart';
import 'package:ProjectTemplate/services/localized/localized.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'app.dart';
import 'config/configure_environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  FlavorConfig(flavor: Flavor.PRODUCTION);
  final language = getIt<ILocalizedLanguage>();
  await language.loadData();
  // mapping error mesage
  final errors = getIt<ErrorMapping>();
  errors.initErrors();
  runApp(MyApp());
}
