import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:bloc_tutorial/network/appException.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {

  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _apiKey = 'af3bca2fef1c8dd8ceaa69f5e27ef822';

  Future<dynamic> get(String url) async {

    var responseJson;

    try {
      final response = await http.get(_baseUrl + url + "?api_key=$_apiKey");
      responseJson = _responseJson(response);
    } on SocketException catch (exp) {
      throw FetchDataException(exp.message.toString());
    }
    return responseJson;
  }

  dynamic _responseJson(http.Response response) {
    
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