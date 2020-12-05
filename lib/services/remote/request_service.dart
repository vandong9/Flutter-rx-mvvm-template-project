import 'package:ProjectTemplate/config/configure_environment.dart';
import 'package:ProjectTemplate/services/remote/logging_interceptor.dart';
// import 'package:http_certificate_pinning/certificate_pinning_interceptor.dart';
import 'api_header.dart';
import 'package:dio/dio.dart';

import 'api_response.dart';

class NoResponseError extends Error {}

enum RequestType { Get, Post, Put }
enum ContentType { formUrlEncodedContentType, JSON }

class Requester {
  Dio _getClient(String baseUrl, List<String> allowedSHAFingerprints) {
    var dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors.addAll([
        // CertificatePinningInterceptor(allowedSHAFingerprints),
        LoggingInterceptor()
      ]);
    return dio;
  }

  String _applyQuery(String path, Map query) {
    if (query != null) {
      query.forEach((k, v) {
        path = path.replaceAll("{$k}", "$v");
      });
    }
    return path;
  }

  // Future<ApiResponseHandler> request(RequestType requestType, String path, Function() completedCallback,
  //     {Function fromJson,
  //     ContentType contentType = ContentType.formUrlEncodedContentType,
  //     Map<String, dynamic> headers,
  //     Map<String, dynamic> params}) async {
  //   return handleResponse.handleApiResponse(() => _request(
  //       requestType, path,
  //       contentType: contentType,
  //       headers: headers,
  //       params: params,
  //       fromJson: fromJson));
  // }

  Future<ApiResponseHandler> request(
      RequestType requestType, String path, ApiResponseHandler handleResponse,
      {Function fromJson,
      ContentType contentType = ContentType.formUrlEncodedContentType,
      Map<String, dynamic> headers,
      Map<String, dynamic> params}) async {
    var dio = _getClient(_applyQuery(path, params), [EnvironmentConfigure.pem]);
    dio.options.headers.addAll(await defaultHeader());
    if (headers != null) {
      dio.options.headers.addAll(headers);
    }
    switch (contentType) {
      case ContentType.formUrlEncodedContentType:
        dio.options.contentType = Headers.formUrlEncodedContentType;
        break;
      case ContentType.JSON:
        dio.options.contentType = Headers.jsonContentType;
        break;
      default:
    }
    // Process path to handle case params in path
    path = _applyQuery(path, params);
    switch (requestType) {
      case RequestType.Get:
        try {
          var response = await dio.get(path, queryParameters: params);
          return handleResponse.fromJson(
              response.data, response.statusCode, fromJson);
        } catch (error) {
          return handleResponse.responseError(error);
        }
        break;
      case RequestType.Post:
        try {
          var response = await dio.post(path, data: params);
          return handleResponse.fromJson(
              response.data, response.statusCode, fromJson);
        } catch (error) {
          return handleResponse.responseError(error);
        }
        break;
      case RequestType.Put:
        try {
          var response = await dio.put(path, data: params);
          return handleResponse.fromJson(
              response.data, response.statusCode, fromJson);
        } catch (error) {
          return handleResponse.responseError(error);
        }
        break;
    }
    return handleResponse.responseError(NoResponseError());
  }

  void uploadFile() {}
}
