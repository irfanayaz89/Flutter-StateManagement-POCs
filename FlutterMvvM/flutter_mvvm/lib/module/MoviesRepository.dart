import 'package:flutter_mvvm/module/MovieResponse.dart';
import 'package:flutter_mvvm/module/Movie.dart';
import 'package:flutter_mvvm/network/apiBaseHelper.dart';

class MoviesRepository {

  final String _apiKey = "9620b570ee4c767b505dd8d9b4e9b191";

  Future<List<Movie>> fetchMoviesList() async {

    final response = await ApiBaseHelper().get("movie/popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
}