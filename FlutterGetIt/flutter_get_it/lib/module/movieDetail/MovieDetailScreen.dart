import 'package:flutter/material.dart';
import 'package:flutter_get_it/locator/locator.dart';
import 'package:flutter_get_it/module/movieDetail/MovieDetailViewModel.dart';
import 'package:flutter_get_it/module/movieDetail/MovieDetail.dart';

class MovieDetailScreen extends StatefulWidget {

  MovieDetailViewModel _movieDetailViewModel;

  MovieDetailScreen({int movieId}) {
    _movieDetailViewModel = getIt<MovieDetailViewModel>(param1: movieId);
  }

  @override
  State<StatefulWidget> createState() => MovieDetailState();
}

class MovieDetailState extends State<MovieDetailScreen> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Movie Mania')),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: widget._movieDetailViewModel.fetchMovieDetail(),
        builder: (context, AsyncSnapshot<MovieDetail> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return null;
            case ConnectionState.active:
            case ConnectionState.waiting:
              return _renderLoadingView();
            case ConnectionState.done:
              return _renderMovieDetailView(context, snapshot);
            default: {
              return null;
            }
          }
        },
      )
    );
  }

  _renderLoadingView() {
    return (
      Center(
        child: CircularProgressIndicator(),
      )
    );
  }

  _renderMovieDetailView(BuildContext context, AsyncSnapshot<MovieDetail> snapshot) {
    
    return (
      Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(
                image: NetworkImage("https://image.tmdb.org/t/p/w185" + snapshot.data.posterPath),
                fit: BoxFit.cover,
                width: 185,
              ),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Title: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: snapshot.data.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
                ]
              )),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Runtime: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: snapshot.data.runtime.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
                ]
              )),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Budget: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: snapshot.data.budget.toString() + "\$", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
                ]
              )),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Vote Average: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: snapshot.data.voteAverage.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
                ]
              )),
              RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Overview: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: snapshot.data.overview, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87))
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