import 'package:flutter/material.dart';

class MovieDetailCard extends StatelessWidget {
  const MovieDetailCard(
      {Key key,
      this.moviePosterUrl,
      this.movieTitle,
      this.movieGenre,
      this.movieCountry,
      this.movieYear,
      this.movieAgeRating,
      this.movieDuration,
      this.movieKpRatingUrl,
      this.movieSynopsis,
      this.movieImdbRating,
      this.movieImdbRatingNumberOfVotes,
      this.movieKpRating,
      this.movieKpRatingNumberOfVotes})
      : super(key: key);

  final String moviePosterUrl;
  final String movieTitle;
  final String movieGenre;
  final String movieCountry;
  final String movieYear;
  final String movieAgeRating;
  final String movieDuration;
  final String movieKpRatingUrl;
  final String movieSynopsis;
  final String movieKpRatingNumberOfVotes;
  final String movieImdbRatingNumberOfVotes;
  final String movieKpRating;
  final String movieImdbRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(160.0, 4.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$movieTitle',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                ),
              ),
              const Divider(),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '· $movieCountry',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '· $movieYear',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '· $movieAgeRating+',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '· $movieGenre',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.av_timer,
                    size: 16.0,
                    color: Colors.black54,
                  ),
                  Text(
                    ' $movieDuration',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 1.0)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '★ кп $movieKpRating',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '/$movieKpRatingNumberOfVotes/ ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 8.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '★ imdb $movieImdbRating',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '/$movieImdbRatingNumberOfVotes/ ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 8.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 8.0)),
              Text(
                '   $movieSynopsis',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
