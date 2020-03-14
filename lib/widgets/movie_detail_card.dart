import 'package:flutter/material.dart';

class MovieDetailCard extends StatelessWidget {
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

  const MovieDetailCard(
      {Key key,
      @required this.moviePosterUrl,
      @required this.movieTitle,
      @required this.movieGenre,
      @required this.movieCountry,
      @required this.movieYear,
      @required this.movieAgeRating,
      @required this.movieDuration,
      @required this.movieKpRatingUrl,
      @required this.movieSynopsis,
      @required this.movieImdbRating,
      @required this.movieImdbRatingNumberOfVotes,
      @required this.movieKpRating,
      @required this.movieKpRatingNumberOfVotes})
      : super(key: key);

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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18.0,
                ),
              ),
              const Divider(color: Colors.blue),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '· $movieCountry',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
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
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '· $movieAgeRating+',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
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
          padding: const EdgeInsets.fromLTRB(12.0, 32.0, 12.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '· $movieGenre',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
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
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '/$movieKpRatingNumberOfVotes/ ',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 8.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '★ imdb $movieImdbRating',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '/$movieImdbRatingNumberOfVotes/ ',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 8.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 8.0),
                child: Text(
                  '   $movieSynopsis',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
