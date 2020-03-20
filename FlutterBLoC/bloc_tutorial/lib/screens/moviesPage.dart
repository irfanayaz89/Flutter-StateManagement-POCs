import 'package:flutter/material.dart';
import 'package:bloc_tutorial/bloc/moviesBloc.dart';
import 'package:bloc_tutorial/models/movie.dart';
import 'package:bloc_tutorial/network/apiResponse.dart';

class MoviesPage extends StatefulWidget {

  MoviesPage({Key key}) : super(key: key);

  @override
  MoviesPageState createState() => MoviesPageState();
}

class MoviesPageState extends State<MoviesPage> {

  MoviesBloc _bloc;

  @override
  void initState() {
    
    super.initState();
    _bloc = MoviesBloc();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Movie Mania')),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchMovieList(),
        child: StreamBuilder<ApiResponse<List<Movie>>>(
          stream: _bloc.movieListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Container(
                    color: Colors.lightBlue,
                    child: Center(  
                      child: Text(snapshot.data.message),
                    ),
                  );
                  break;
                case Status.COMPLETED:
                  return _renderMoviesListView(context, snapshot.data.data);
                case Status.ERROR:
                  return Text(snapshot.data.message);
              }
            }
            return Container();
          },
        ),
      )
    );
  }

  _renderMoviesListView(BuildContext context, List<Movie> moviesList) {

    return ListView.builder(
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        return 
        Card( child: 
        ListTile(
            title: Text(moviesList[index].title)
            // onTap: () { this.onItemClick(index); 
            // },
          ),
        );
      },
    );
  }
}