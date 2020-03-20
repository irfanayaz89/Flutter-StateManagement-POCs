import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/movieDetail/MovieDetailViewModel.dart';
import 'package:flutter_mvvm/module/movieDetail/MovieDetail.dart';
import 'package:flutter_mvvm/module/movieList/MovieListViewModel.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatefulWidget {

  final int movieId;
  
  MovieDetailScreen({@required this.movieId});

  @override
  State<StatefulWidget> createState() => MovieDetailState();
}

class MovieDetailState extends State<MovieDetailScreen> {

  MovieDetailViewModel _movieDetailViewModel;

  @override
  void initState() {
    
    super.initState();
    _movieDetailViewModel = Provider.of<MovieDetailViewModel>(context, listen: false);
    _movieDetailViewModel.fetchMovieDetail(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Movie Mania')),
      backgroundColor: Colors.white,
      body: Consumer<MovieDetailViewModel>(
        builder: (context, movieDetailViewModel, child) {

          if (movieDetailViewModel.movieDetails == null) return this._renderLoadingView();

          return this._renderMovieDetailView(context, movieDetailViewModel.movieDetails);
        })
    );
  }

  _renderLoadingView() {
    return (
      Center(
        child: CircularProgressIndicator(),
      )
    );
  }

  _renderMovieDetailView(BuildContext context, MovieDetail movieDetail) {
    
    return (
      Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(
                image: NetworkImage("https://image.tmdb.org/t/p/w185" + movieDetail.posterPath),
                fit: BoxFit.cover,
                width: 185,
              ),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Title: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: movieDetail.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
                ]
              )),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Runtime: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: movieDetail.runtime.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
                ]
              )),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Budget: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: movieDetail.budget.toString() + "\$", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
                ]
              )),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Vote Average: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: movieDetail.voteAverage.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
                ]
              )),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Overview: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: movieDetail.overview, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
                ]
              )),
            ],
          ),
          padding: EdgeInsets.all(16),
          alignment: FractionalOffset(0.5, 0),
        )
    );
  }
}