import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/movieDetail/MovieDetail.dart';
import 'package:flutter_mvvm/module/movieDetail/MovieDetailRepository.dart';

class MovieDetailViewModel with ChangeNotifier {

  final MovieDetailRepository movieDetailRepository;

  MovieDetail _movieDetail;

  MovieDetail get movieDetails => _movieDetail;

  MovieDetailViewModel({@required this.movieDetailRepository});

  fetchMovieDetail(int movieId) async {
    
    // Not sure about this
    _movieDetail = null;
    notifyListeners();

    _movieDetail = await movieDetailRepository.fetchMovieDetail(movieId);
    notifyListeners();
  }
}