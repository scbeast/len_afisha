import 'package:flutter/material.dart';

class RdkEventDetailCard extends StatelessWidget {
  final String rdkEventPosterUrl;
  final String rdkEventTitle;
  final String rdkEventAgeRating;
  final String rdkEventDuration;
  final String rdkEventSynopsis;

  const RdkEventDetailCard({
    Key key,
    @required this.rdkEventPosterUrl,
    @required this.rdkEventTitle,
    @required this.rdkEventAgeRating,
    @required this.rdkEventDuration,
    @required this.rdkEventSynopsis,
  }) : super(key: key);

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
                '$rdkEventTitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18.0,
                ),
              ),
              const Divider(),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '· $rdkEventAgeRating+',
                maxLines: 1,
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
                    ' $rdkEventDuration',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 42.0, 24.0, 8.0),
          child: Text(
            '   $rdkEventSynopsis',
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
    );
  }
}
