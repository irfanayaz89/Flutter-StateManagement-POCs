class Movie {

  int id;
  var voteAverage;
  String title;
  String posterPath;
  String overview;
  String releaseDate;

  Movie.fromJson(Map<String, dynamic> json) {
    
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterPath = json['poster_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }
}