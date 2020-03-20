import 'dart:async';
import 'dart:convert';
import 'package:flutter_mvvm/module/Movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepo {
  
  SharedPreferences sharedPrefs;

  SharedPreferencesRepo() {
    init();
  }

  Future init() async {

    sharedPrefs = await SharedPreferences.getInstance();
  }

  saveMovies(List<Movie> moviesList) {

    sharedPrefs.setString("movies", json.encode(moviesList));
  }

  List<Movie> getMovies() {

    String moviesStr = null;
    List<Movie> moviesList = null;

    try {
      moviesStr = sharedPrefs.getString("movies");
    } on Exception catch (exp) {
      print('never reached');
    }
    if (moviesStr != null) {
      moviesList = (json.decode(moviesStr) as List).map((i) => Movie.fromJson(i)).toList();
    }
    return moviesList;
  }
}