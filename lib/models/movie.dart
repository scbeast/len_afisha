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
    id = json['id'];
    title = json['title'];
    country = json['country'];
    year = json['year'];
    genre = json['genre'];
    synopsis = json['synopsis'];
    duration = json['duration'];
    ageRating = json['age'];
    posterUrl = json['posterUrl'];
    ratingUrl = json['ratingUrl'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['country'] = this.country;
    data['year'] = this.year;
    data['genre'] = this.genre;
    data['synopsis'] = this.synopsis;
    data['duration'] = this.duration;
    data['age'] = this.ageRating;
    data['posterUrl'] = this.posterUrl;
    data['ratingUrl'] = this.ratingUrl;
    data['rating'] = this.rating;
    return data;
  }
}