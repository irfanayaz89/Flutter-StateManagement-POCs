import 'package:flutter_get_it/module/Movie.dart';

class MovieResponse {

  int totalResults;
  List<Movie> results;

  MovieResponse.fromJson(Map<String, dynamic> json) {
    
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = List<Movie>();
      json['results'].forEach((v) {
        results.add(Movie.fromJson(v));
      });
    }
  }
}