import 'package:bloc_tutorial/models/movieResponse.dart';
import 'package:bloc_tutorial/network/networkHelper.dart';
import 'package:bloc_tutorial/models/movie.dart';

class MoviesRepository {

  NetworkHelper _helper = NetworkHelper();

  Future<List<Movie>> fetchMoviesList() async {

    final response = await _helper.get("movie/popular");
    return MovieResponse.fromJson(response).results;
  }
}