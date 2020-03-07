import 'package:flutter/material.dart';

class RdkEventDetailCard extends StatelessWidget {
  const RdkEventDetailCard({
    Key key,
    this.rdkEventPosterUrl,
    this.rdkEventTitle,
    this.rdkEventAgeRating,
    this.rdkEventDuration,
    this.rdkEventSynopsis,
  }) : super(key: key);

  final String rdkEventPosterUrl;
  final String rdkEventTitle;
  final String rdkEventAgeRating;
  final String rdkEventDuration;
  final String rdkEventSynopsis;

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
                '· $rdkEventAgeRating+',
                maxLines: 1,
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
                    ' $rdkEventDuration',
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(bottom: 20.0)),
              Text(
                '   $rdkEventSynopsis',
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
