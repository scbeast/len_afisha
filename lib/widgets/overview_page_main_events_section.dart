import 'package:flutter/material.dart';

class OverviewPageAnnouncementsSection extends StatelessWidget {
  const OverviewPageAnnouncementsSection({
    Key key,
    @required String announcementTitle,
    @required String announcementSubtitle,
    @required String announcementSynopsis,
  })  : announcementTitle = announcementTitle,
        announcementSubtitle = announcementSubtitle,
        announcementSynopsis = announcementSynopsis,
        super(key: key);

  final String announcementTitle;
  final String announcementSubtitle;
  final String announcementSynopsis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(bottom: 2.0)),
          Text(
            '$announcementTitle',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            '$announcementSubtitle',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 2.0)),
          Text(
            '· $announcementSynopsis',
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
          Divider(),
        ],
      ),
    );
  }
}
