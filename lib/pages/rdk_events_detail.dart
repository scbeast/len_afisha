import 'package:flutter/material.dart';
import 'package:len_afisha/models/rdk_event.dart';
import 'package:len_afisha/widgets/rdk_event_detail_card.dart';
import 'package:len_afisha/widgets/rdk_event_detail_page_sliver_appbar.dart';

class RdkEventDetailPage extends StatelessWidget {
  static const routName = 'rdk-event-detail-page';
  const RdkEventDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RdkEvent _rdkEvent =
        ModalRoute.of(context).settings.arguments as RdkEvent;
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: RdkEventDetailPageSliverAppBar(
                expandedHeight: 200, rdkEvent: _rdkEvent),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: RdkEventDetailCard(
              rdkEventPosterUrl: _rdkEvent.posterUrl,
              rdkEventTitle: _rdkEvent.title,
              rdkEventAgeRating: _rdkEvent.ageRating.toString(),
              rdkEventDuration: _rdkEvent.duration,
              rdkEventSynopsis: _rdkEvent.synopsis,
            ),
          ),
        ],
      ),
    );
  }
}
