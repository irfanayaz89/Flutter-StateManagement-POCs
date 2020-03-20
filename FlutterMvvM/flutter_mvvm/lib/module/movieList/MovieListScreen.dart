import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/Movie.dart';
import 'package:flutter_mvvm/module/movieList/MovieListViewModel.dart';
import 'package:flutter_mvvm/module/movieDetail/MovieDetailScreen.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {

  @override
  MovieListScreenState createState() => MovieListScreenState();
}

class MovieListScreenState extends State<MovieListScreen> {

  MovieListViewModel _movieListViewModel;

  @override
  void initState() {
    
    super.initState();
    _movieListViewModel = Provider.of<MovieListViewModel>(context, listen: false);
    _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Movie Mania')),
      backgroundColor: Colors.white,
      body: _renderMoviesListView()
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

  _renderMoviesListView() {
    return (
      Consumer<MovieListViewModel>(
        builder: (context, moviesViewModel, child) {
          if (moviesViewModel.movies == null) return this._renderLoadingView();

          return (
            ListView.builder(
              itemCount: moviesViewModel.movies.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(moviesViewModel.movies[index].title),
                    onTap: () { 
                      this._onItemClick(context, moviesViewModel.movies[index]); 
                    },
                  ),
                );
              }
            )
          );
        },
      )
    );
  }

  _onItemClick(BuildContext buildContext, Movie movie) {

    Navigator.of(buildContext).push(MaterialPageRoute(builder: (context)  => MovieDetailScreen(movieId: movie.id)));
  }

  _fetchMovies() async {

    _movieListViewModel.fetchMoviesList();
  }
}