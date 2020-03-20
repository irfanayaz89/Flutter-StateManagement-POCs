import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_get_it/common/SharedPrefsRepo.dart';
import 'package:flutter_get_it/locator/locator.dart';
import 'package:flutter_get_it/module/Movie.dart';
import 'package:flutter_get_it/module/MoviesRepository.dart';

class MovieListViewModel {

  List<Movie> _movies;
  final MoviesRepository moviesRepository;

  SharedPreferencesRepo sharedPrefs = getIt<SharedPreferencesRepo>();

  List<Movie> get movies => _movies;

  MovieListViewModel({@required this.moviesRepository});

  Future<List<Movie>> fetchMoviesList() async {
    
    _movies = sharedPrefs.getMovies();

    if (_movies == null) {
      _movies = await moviesRepository.fetchMoviesList();
      sharedPrefs.saveMovies(_movies);
    }
    return _movies;
  } 
}