import 'dart:convert';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future onError(DioError err) async {
    print("""ERROR:
    URL: ${err.request.uri}\n
    Method: ${err.request.method} 
    Headers: ${json.encode(err.response.headers.map)}
    StatusCode: ${err.response.statusCode}
    Data: ${json.encode(err.response.data)}
    <-- END HTTP
        """);
    return super.onError(err);
  }

  @override
  Future onRequest(RequestOptions options) async {
    print("""REQUEST:
    ${cURLRepresentation(options)}
    """);
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    print("""RESPONSE:
    URL: ${response.request.uri}
    Method: ${response.request.method}
    Headers: ${json.encode(response.request.headers)}
    Data: ${json.encode(response.data)}
        """);
    return super.onResponse(response);
  }

  String cURLRepresentation(RequestOptions options) {
    List<String> components = ["\$ curl -i"];
    if (options.method != null && options.method.toUpperCase() == "GET") {
      components.add("-X ${options.method}");
    }

    if (options.headers != null) {
      options.headers.forEach((k, v) {
        if (k != "Cookie") {
          components.add("-H \"$k: $v\"");
        }
      });
    }

    if (options.method == "POST" && options.data != null) {
      if (options.contentType == "application/x-www-form-urlencoded") {
        options.data.forEach((k, v) {
          components.add("-d \"$k=$v\"");
        });
      } else {
        /// for type application/json
        var data = json.encode(options.data);
        if (data != null) {
          data = data.replaceAll('\"', '\\\"');
          components.add("-d \"$data\"");
        }
      }
    }

    components.add("\"${options.uri.toString()}\"");

    return components.join('\\\n\t');
  }
}
