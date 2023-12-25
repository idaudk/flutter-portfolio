import 'dart:async';
import 'package:logger/logger.dart' as p_logger;
import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ErrorHandler implements RequestInterceptor, ResponseInterceptor {
  final logger = p_logger.Logger();

  @override
  FutureOr<Request> onRequest(Request request) async {
    if (await hasInternetConnection()) {
      throw NetworkErrorException();
    }
    return request;
  }

  @override
  Future<Response> onResponse(Response response) async {
    logger.i(response.statusCode);
    if (response.statusCode >= 400) {
      // Handle different types of errors based on status codes
      switch (response.statusCode) {
        case 400:
          throw BadRequestException();
        case 401:
          throw UnauthorizedException();
        case 404:
          throw NotFoundException();
        default:
          throw GeneralHttpException(response.statusCode);
      }
    }

    return response;
  }
}

// Exception classes for different types of errors
class BadRequestException implements Exception {
  final message = 'Bad Request';
  @override
  String toString() => message;
}

class UnauthorizedException implements Exception {
  final message = 'Unauthorized';
  @override
  String toString() => message;
}

class NotFoundException implements Exception {
  final message = 'Not Found';
  @override
  String toString() => message;
}

class GeneralHttpException implements Exception {
  final statusCode;

  GeneralHttpException(this.statusCode);

  @override
  String toString() => 'HTTP Error: $statusCode';
}

class NetworkErrorException implements Exception {
  final message = 'Network Error';
  @override
  String toString() => message;
}

class GeneralErrorException implements Exception {
  final error;

  GeneralErrorException(this.error);

  @override
  String toString() => 'General Error: $error';
}

class MobileDataCostException implements Exception {
  final message =
      'Downloading large files on a mobile data connection may incur costs';
  @override
  String toString() => message;
}

Future<bool> hasInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.none) {
    return false;
  } else {
    p_logger.Logger().w(connectivityResult);
    return true;
  }
}
