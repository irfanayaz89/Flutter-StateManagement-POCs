import 'package:flutter_mvvm/module/movieDetail/MovieDetail.dart';
import 'package:flutter_mvvm/network/apiBaseHelper.dart';

class MovieDetailRepository {

  final String _apiKey = "9620b570ee4c767b505dd8d9b4e9b191";

  Future<MovieDetail> fetchMovieDetail(int movieId) async {

    final response = await ApiBaseHelper().get("movie/$movieId?api_key=$_apiKey");
    return MovieDetail.fromJson(response);
  }
}