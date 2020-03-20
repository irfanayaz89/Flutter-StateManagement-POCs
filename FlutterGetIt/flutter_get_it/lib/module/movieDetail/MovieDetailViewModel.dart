import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_get_it/module/movieDetail/MovieDetail.dart';
import 'package:flutter_get_it/module/movieDetail/MovieDetailRepository.dart';

class MovieDetailViewModel {

  final MovieDetailRepository movieDetailRepository;
  final int movieId;

  MovieDetailViewModel({@required this.movieDetailRepository, @required this.movieId});

  Future<MovieDetail> fetchMovieDetail() async {
    
    MovieDetail movieDetail = await movieDetailRepository.fetchMovieDetail(this.movieId);
    return movieDetail;
  }
}