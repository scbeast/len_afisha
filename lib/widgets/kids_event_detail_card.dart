import 'package:flutter/material.dart';

class KidsEventDetailCard extends StatelessWidget {
  final String kidsEventPosterUrl;
  final String kidsEventTitle;
  final String kidsEventAgeRating;
  final String kidsEventDuration;
  final String kidsEventSynopsis;

  const KidsEventDetailCard({
    Key key,
    @required this.kidsEventPosterUrl,
    @required this.kidsEventTitle,
    @required this.kidsEventAgeRating,
    @required this.kidsEventDuration,
    @required this.kidsEventSynopsis,
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
                '$kidsEventTitle',
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
                '· $kidsEventAgeRating+',
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
                    ' $kidsEventDuration',
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
            '   $kidsEventSynopsis',
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
