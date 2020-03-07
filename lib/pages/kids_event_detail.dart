import 'package:flutter/material.dart';
import 'package:len_afisha/models/kids_event.dart';
import 'package:len_afisha/widgets/kids_event_detail_card.dart';
import 'package:len_afisha/widgets/kids_event_detail_page_sliver_appbar.dart';

class KidsEventDetailPage extends StatelessWidget {
  static const routName = 'kids-event-detail-page';
  const KidsEventDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KidsEvent _kidsEvent =
        ModalRoute.of(context).settings.arguments as KidsEvent;
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: KidsEventDetailPageSliverAppBar(
                expandedHeight: 200, kidsEvent: _kidsEvent),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: KidsEventDetailCard(
              kidsEventPosterUrl: _kidsEvent.posterUrl,
              kidsEventTitle: _kidsEvent.title,
              kidsEventAgeRating: _kidsEvent.ageRating.toString(),
              kidsEventDuration: _kidsEvent.duration,
              kidsEventSynopsis: _kidsEvent.synopsis,
            ),
          ),
        ],
      ),
    );
  }
}
