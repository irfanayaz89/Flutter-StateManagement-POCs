import 'package:flutter_get_it/locator/locator.dart';
import 'package:flutter_get_it/module/movieDetail/MovieDetail.dart';
import 'package:flutter_get_it/network/apiBaseHelper.dart';

class MovieDetailRepository {

  final String _apiKey = "9620b570ee4c767b505dd8d9b4e9b191";

  ApiBaseHelper _helper = getIt<ApiBaseHelper>();

  Future<MovieDetail> fetchMovieDetail(int movieId) async {

    final response = await _helper.get("movie/$movieId?api_key=$_apiKey");
    return MovieDetail.fromJson(response);
  }
}