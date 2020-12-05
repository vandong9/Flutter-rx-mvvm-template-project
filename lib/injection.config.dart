// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'services/firebase/firebase_analytics.dart';
import 'manager/app_data_manager.dart';
import 'services/navigator/app_navigator.dart';
import 'services/network_status/connectivity_service.dart';
import 'res/error_mapping.dart';
import 'services/localized/localized.dart';
import 'routes.dart';
import 'manager/request_manager.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);

  // Eager singletons must be registered in the right order
  gh.singleton<AnalyticsService>(AnalyticsService());
  gh.singleton<AppDataManager>(AppDataManager());
  gh.singleton<AppNavigator>(AppNavigator());
  gh.singleton<ConnectivityService>(ConnectivityService());
  gh.singleton<ErrorMapping>(ErrorMapping());
  gh.singleton<ILocalizedLanguage>(MultipleLanguage());
  gh.singleton<IRoute>(AppRoute());
  gh.singleton<RequestManager>(RequestManager());
  return get;
}
