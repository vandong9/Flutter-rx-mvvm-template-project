class ApiResponseHandler {
  String message;
  String statusCode;
  dynamic data;
  int httpCode;

  Exception error; // In case try catch have error

  bool get hasErrorMessage => message == null || message.isEmpty;
  bool isSuccessful() {
    return true;
  }

  ApiResponseHandler(
      {this.message, this.statusCode, this.data, this.httpCode, this.error});

  ApiResponseHandler responseError(error) {
    ApiResponseHandler apiResponse = ApiResponseHandler();
    apiResponse.error = error;
    return apiResponse;
  }

  // Future<ApiResponseHandler> handleApiResponse();

  ApiResponseHandler fromJson(json, httpCode, fromJson) {
    ApiResponseHandler apiResponse = ApiResponseHandler();
    apiResponse.httpCode = httpCode;
    apiResponse.message = json["message"] is String ? json["message"] : "";
    apiResponse.statusCode =
        json["statusCode"] is String ? json["statusCode"] : "";
    return apiResponse;
  }
}
