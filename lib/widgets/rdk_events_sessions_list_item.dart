import 'package:flutter/material.dart';

class RdkEventsSessionsListItem extends StatelessWidget {
  final String rdkEventTitle;
  final String rdkEventDuration;
  final String rdkEventAgeRating;
  final String rdkEventDay;
  final String rdkEventWeekDay;
  final String rdkEventMonth;
  final String rdkEventTime;
  final String rdkEventPosterUrl;

  const RdkEventsSessionsListItem(
      {Key key,
      @required this.rdkEventTitle,
      @required this.rdkEventDuration,
      @required this.rdkEventAgeRating,
      @required this.rdkEventDay,
      @required this.rdkEventWeekDay,
      @required this.rdkEventMonth,
      @required this.rdkEventTime,
      @required this.rdkEventPosterUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 130.0,
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
                    image: rdkEventPosterUrl,
                    width: 100.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 2.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ' $rdkEventDay $rdkEventMonth · $rdkEventWeekDay ·',
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
                            ' $rdkEventTime',
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
                            '$rdkEventTitle',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          const Divider(color: Colors.blue),
                          const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                          Text(
                            ' · $rdkEventAgeRating+',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.black54,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.av_timer,
                                size: 12.0,
                                color: Colors.black54,
                              ),
                              Text(
                                ' $rdkEventDuration ·',
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
