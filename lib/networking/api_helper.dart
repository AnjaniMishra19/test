import 'package:sahash/config/environment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'api_exception.dart';

class ApiHelper {
  Future<dynamic> get(String url, dynamic queryParameters) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http.get(
        //ToDo - get the url based on the enviornment setup
        Uri.https(Environment.apiBaseUrl, url, queryParameters),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    try {
      final response = await http.delete(
        //ToDo - get the url based on the enviornment setup
        Uri.https(Environment.apiBaseUrl, url),
      );

      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> post(String url, dynamic data) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http.post(
          //ToDo - get the url based on the enviornment setup
          Uri.https(Environment.apiBaseUrl, url),
          body: jsonEncode(data));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson =
            response.body.isEmpty ? true : jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
