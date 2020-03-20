import 'package:flutter/material.dart';
import 'package:flutter_get_it/locator/locator.dart';
import 'package:flutter_get_it/module/Movie.dart';
import 'package:flutter_get_it/module/movieList/MovieListViewModel.dart';
import 'package:flutter_get_it/module/movieDetail/MovieDetailScreen.dart';

class MovieListScreen extends StatefulWidget {

  @override
  MovieListScreenState createState() => MovieListScreenState();
}

class MovieListScreenState extends State<MovieListScreen> {

  MovieListViewModel _movieListViewModel = getIt<MovieListViewModel>();

  @override
  void initState() {
    
    super.initState();
    _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {

    var moviesList = _movieListViewModel.movies;

    if (moviesList == null) {
      return this._renderLoadingView();
    }

    return Scaffold(
      appBar: AppBar(title: Text('Movie Mania')),
      backgroundColor: Colors.white,
      body: _renderMoviesListView(context, moviesList)
    );
  }

  _renderLoadingView() {
    return (
      Container(
        color: Colors.white,
        child: CircularProgressIndicator(),
        alignment: FractionalOffset(0.5, 0.5),
      )
    );
  }

  _renderMoviesListView(BuildContext context, List<Movie> movies) {
    return (
      ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(movies[index].title),
              onTap: () { 
                this._onItemClick(context, movies[index]); 
              },
            ),
          );
        }
      )
    );
  }

  _onItemClick(BuildContext buildContext, Movie movie) {

    Navigator.of(buildContext).push(MaterialPageRoute(builder: (context)  => MovieDetailScreen(movieId: movie.id)));
  }

  _fetchMovies() async {

    var movies = await _movieListViewModel.fetchMoviesList();
    setState(() {});
  }
}