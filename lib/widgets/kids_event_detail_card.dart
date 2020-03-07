import 'package:flutter/material.dart';

class KidsEventDetailCard extends StatelessWidget {
  const KidsEventDetailCard({
    Key key,
    this.kidsEventPosterUrl,
    this.kidsEventTitle,
    this.kidsEventAgeRating,
    this.kidsEventDuration,
    this.kidsEventSynopsis,
  }) : super(key: key);

  final String kidsEventPosterUrl;
  final String kidsEventTitle;
  final String kidsEventAgeRating;
  final String kidsEventDuration;
  final String kidsEventSynopsis;

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
                '$kidsEventTitle',
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
                '· $kidsEventAgeRating+',
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
                    ' $kidsEventDuration',
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
                '   $kidsEventSynopsis',
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
