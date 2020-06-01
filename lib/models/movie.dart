class Movie {
  String id;
  String title;
  String country;
  String year;
  String genre;
  String synopsis;
  String duration;
  String posterUrl;
  String ratingUrl;
  String rating;
  String kpRatingNumberOfVotes;
  String imdbRatingNumberOfVotes;
  String kpRating;
  String imdbRating;
  int ageRating;

  Movie(
      {this.id,
      this.title,
      this.country,
      this.year,
      this.genre,
      this.synopsis,
      this.duration,
      this.ageRating,
      this.posterUrl,
      this.rating});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    title = json['title'] as String;
    country = json['country'] as String;
    year = json['year'] as String;
    genre = json['genre'] as String;
    synopsis = json['synopsis'] as String;
    duration = json['duration'] as String;
    ageRating = json['age'] as int;
    posterUrl = json['posterUrl'] as String;
    ratingUrl = json['ratingUrl'] as String;
    rating = json['rating'] as String;
  }
}
