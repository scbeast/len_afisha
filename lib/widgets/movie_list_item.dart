import 'package:flutter/material.dart';

class MovieListTile extends StatelessWidget {
  MovieListTile(
      {Key key,
      this.movieDay,
      this.movieMonth,
      this.movieDayOfWeek,
      this.movieTime,
      this.movieTitle,
      this.movieAgeRating,
      this.movieDuration,
      this.movieGenre,
      this.movieYear,
      this.movieCountry})
      : super(key: key);

  final String movieDay;
  final String movieMonth;
  final String movieTime;
  final String movieTitle;
  final String movieAgeRating;
  final String movieDuration;
  final String movieGenre;
  final String movieYear;
  final String movieCountry;
  final String movieDayOfWeek;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                ' $movieDay $movieMonth · $movieDayOfWeek ·',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                ' $movieTime',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 4.0)),
              Text(
                '$movieTitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              Divider(),
              Text(
                ' · $movieCountry',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                ' · $movieYear',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                ' · $movieGenre',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                ' · $movieAgeRating+',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.av_timer,
                    size: 12.0,
                    color: Colors.black54,
                  ),
                  Text(
                    ' $movieDuration ·',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MovieListItem extends StatelessWidget {
  MovieListItem({
    Key key,
    this.posterUrl,
    this.movieDay,
    this.movieMonth,
    this.movieTime,
    this.movieDayOfWeek,
    this.movieTitle,
    this.movieAgeRating,
    this.movieDuration,
    this.movieGenre,
    this.movieYear,
    this.movieCountry,
  }) : super(key: key);

  final String posterUrl;
  final String movieDay;
  final String movieMonth;
  final String movieTime;
  final String movieTitle;
  final String movieAgeRating;
  final String movieDuration;
  final String movieGenre;
  final String movieYear;
  final String movieCountry;
  final String movieDayOfWeek;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Card(
                elevation: 5.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/wait-poster.gif',
                    image: posterUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 2.0, 0.0),
                child: MovieListTile(
                  movieTitle: movieTitle,
                  movieGenre: movieGenre,
                  movieYear: movieYear,
                  movieCountry: movieCountry,
                  movieDay: movieDay,
                  movieMonth: movieMonth,
                  movieTime: movieTime,
                  movieDayOfWeek: movieDayOfWeek,
                  movieDuration: movieDuration,
                  movieAgeRating: movieAgeRating,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
