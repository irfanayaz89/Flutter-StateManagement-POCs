import 'dart:io';
import 'dart:convert';
import 'package:flutter_mvvm/common/AppException.dart';
import 'package:http/http.dart' as http;


class ApiBaseHelper {

  final String _baseUrl = "https://api.themoviedb.org/3/";

  Future<dynamic> get(String url, {Map<String, String> headers = null}) async {
    
    var responseJson;

    try {
      final response = await http.get(_baseUrl + url, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException catch (exc) {
      throw FetchDataException(exc.message.toString());
    }
    return responseJson;
  }

  Future<dynamic> put({String url, File file}) async {

    try {
      final response = await http.put(url, body: file.readAsBytesSync());
      return response.statusCode == 200;
    }
    on SocketException catch (exc) {
      throw FetchDataException(exc.message.toString());
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error:: Code: ${response.statusCode} Message: ${response.body.toString()}');
    }
  }
}