import 'package:ProjectTemplate/services/remote/api.dart';
import 'package:ProjectTemplate/services/remote/api_response.dart';
import 'package:ProjectTemplate/services/remote/request_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

class ResponseError {
  final String message;
  final dynamic data;

  ResponseError({this.message, this.data});
}

@singleton
class RequestManager {
  Future<Either<String, ResponseError>> sampleRequest(
      String value) async {
    final Requester _requester = Requester();
    ApiResponseHandler response = await _requester.request(
        RequestType.Post, ApiConstant.SamplePath, ApiResponseHandler(),
        params: {"sampleParam": value});
    if (response.isSuccessful()) {
      return Left(response.data);
    } else {
      return Right(ResponseError(message: response.message, data: null));
    }
  }
}
