import 'package:flutter_get_it/locator/locator.dart';
import 'package:flutter_get_it/module/MovieResponse.dart';
import 'package:flutter_get_it/module/Movie.dart';
import 'package:flutter_get_it/network/apiBaseHelper.dart';

class MoviesRepository {

  final String _apiKey = "9620b570ee4c767b505dd8d9b4e9b191";

  ApiBaseHelper _helper = getIt<ApiBaseHelper>();

  Future<List<Movie>> fetchMoviesList() async {

    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
}