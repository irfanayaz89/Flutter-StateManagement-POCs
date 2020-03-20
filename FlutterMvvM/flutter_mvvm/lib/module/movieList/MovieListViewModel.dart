import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/Movie.dart';
import 'package:flutter_mvvm/module/MoviesRepository.dart';

class MovieListViewModel with ChangeNotifier {

  List<Movie> _movies;
  final MoviesRepository moviesRepository;

  List<Movie> get movies => _movies;

  MovieListViewModel({@required this.moviesRepository});

  fetchMoviesList() async {
    
    _movies = await moviesRepository.fetchMoviesList();
    notifyListeners();
  } 
}