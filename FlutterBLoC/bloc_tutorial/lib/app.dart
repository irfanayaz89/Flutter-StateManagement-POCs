import 'package:flutter/material.dart';
import 'package:bloc_tutorial/screens/moviesPage.dart';
import 'package:bloc_tutorial/theme/styles.dart';

class App {

  var materialApp = MaterialApp(
      title: "Flutter Flat App",
      home: MoviesPage(),
      theme: appTheme,
  );

  App() {
    runApp(materialApp);
  }
}