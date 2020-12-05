import 'package:ProjectTemplate/injection.dart';
import 'package:ProjectTemplate/manager/app_data_manager.dart';

Future<Map<String, dynamic>> defaultHeader() async {
  Map<String, dynamic> headers = Map<String, dynamic>();
  headers["Accept"] = "application/json";
  headers["token"] = getIt<AppDataManager>().currentToken ?? "";
  headers["Accept-Encoding"] = "gzip";

  return headers;
}
