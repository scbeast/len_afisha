import 'package:flutter/material.dart';

class KidsSessionsListItem extends StatelessWidget {
  final String kidsEventTitle;
  // final String kidsEventSynopsis;
  final String kidsEventDuration;
  final String kidsEventAgeRating;
  final String kidsEventDay;
  final String kidsEventWeekDay;
  final String kidsEventMonth;
  final String kidsEventTime;
  final String kidsEventPosterUrl;

  KidsSessionsListItem(
      {Key key,
      @required this.kidsEventTitle,
      // @required this.kidsEventSynopsis,
      @required this.kidsEventDuration,
      @required this.kidsEventAgeRating,
      @required this.kidsEventDay,
      @required this.kidsEventWeekDay,
      @required this.kidsEventMonth,
      @required this.kidsEventTime,
      @required this.kidsEventPosterUrl})
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
                    image: kidsEventPosterUrl,
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
                            ' $kidsEventDay $kidsEventMonth · $kidsEventWeekDay ·',
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
                            ' $kidsEventTime',
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
                            '$kidsEventTitle',
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
                            ' · $kidsEventAgeRating+',
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
                                ' $kidsEventDuration ·',
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
