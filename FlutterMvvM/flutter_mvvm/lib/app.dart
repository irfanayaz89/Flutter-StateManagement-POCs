import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/movieList/MovieListScreen.dart';
import 'package:flutter_mvvm/theme.dart/style.dart';

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return (
      MaterialApp(
        title: "Flutter MvvM",
        theme: appTheme,
        home: MovieListScreen(),
      )
    );
  }
}