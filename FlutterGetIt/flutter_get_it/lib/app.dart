import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_it/module/movieList/MovieListScreen.dart';
import 'package:flutter_get_it/theme.dart/style.dart';
import 'package:flutter_get_it/locator/locator.dart';

class App extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return (
      FutureBuilder(
        future: getIt.allReady(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
                title: "Flutter MvvM",
                theme: appTheme,
                home: MovieListScreen(),
              );
          } else {
            return (
              Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()),
              )
            );
          }
        })
    );
  }
}