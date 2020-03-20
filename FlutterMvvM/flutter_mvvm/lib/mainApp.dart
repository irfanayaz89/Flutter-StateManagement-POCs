import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/app.dart';
import 'package:flutter_mvvm/module/MoviesRepository.dart';
import 'package:flutter_mvvm/module/movieDetail/MovieDetailRepository.dart';
import 'package:flutter_mvvm/module/movieDetail/MovieDetailViewModel.dart';
import 'package:flutter_mvvm/module/movieList/MovieListViewModel.dart';
import 'package:provider/provider.dart';

class MainApp {

  MainApp() {
    runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieListViewModel(moviesRepository: MoviesRepository())
        ),
        ChangeNotifierProvider(
          create: (context) => MovieDetailViewModel(movieDetailRepository: MovieDetailRepository())
        )
      ],
      child: App(),
    )
    );
  }
}