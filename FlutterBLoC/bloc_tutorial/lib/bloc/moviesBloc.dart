import 'dart:async';

import 'package:bloc_tutorial/network/apiResponse.dart';
import 'package:bloc_tutorial/repo/MoviesRepository.dart';
import 'package:bloc_tutorial/models/movie.dart';

class MoviesBloc {

  MoviesRepository _moviesRepository;
  
  StreamController _movieListController = StreamController<ApiResponse<List<Movie>>>();
  StreamSink<ApiResponse<List<Movie>>> get movieListSink => _movieListController.sink;
  Stream<ApiResponse<List<Movie>>> get movieListStream => _movieListController.stream;

  MoviesBloc() {

    _moviesRepository = MoviesRepository();

    fetchMovieList();
  }

  fetchMovieList() async {

    movieListSink.add(ApiResponse.loading('Fetching Data'));

    try {
      List<Movie> movies = await _moviesRepository.fetchMoviesList();
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {

    _movieListController?.close();
  }
}