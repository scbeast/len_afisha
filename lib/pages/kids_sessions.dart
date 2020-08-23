import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/models/kids_event_session.dart';
import 'package:len_afisha/pages/kids_event_detail.dart';
import 'package:len_afisha/widgets/empty_events_list.dart';
import 'package:len_afisha/widgets/i_am_busy_now.dart';
import 'package:len_afisha/widgets/kids_sessions_list_item.dart';
import 'package:provider/provider.dart';

class KidsSessionsPage extends StatelessWidget {
  static const routName = 'kids-sessions-page';
  const KidsSessionsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsData>(
      builder: (context, eventsData, _) {
        if (eventsData.iAmBusyNow) {
          return const IAmBusyNowIndicator();
        } else {
          return const BuildKidsSessionsListView();
        }
      },
    );
  }
}

class BuildKidsSessionsListView extends StatelessWidget {
  const BuildKidsSessionsListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsData _eventsData = Provider.of<EventsData>(context);
    final List<KidsEventSession> _sessions = _eventsData.kidsEventsSessions;
    if (_sessions.isEmpty) {
      return const EmptyEventsListWidget();
    } else {
      return AnimationLimiter(
        child: ListView.builder(
          itemCount: _sessions.length,
          itemBuilder: (BuildContext context, int index) {
            final _kidsEvent =
                _eventsData.findKidsEventById(_sessions[index].id);
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 600),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: GestureDetector(
                    child: Card(
                      elevation: 5.0,
                      child: KidsSessionsListItem(
                        kidsEventTitle: _kidsEvent.title,
                        kidsEventDay: _sessions[index].dateTime.day.toString(),
                        kidsEventMonth: _sessions[index].month,
                        kidsEventWeekDay: _sessions[index].weekDay,
                        kidsEventTime: _sessions[index]
                            .dateTime
                            .toString()
                            .substring(11, 16),
                        kidsEventDuration: _kidsEvent.duration,
                        kidsEventAgeRating: _kidsEvent.ageRating.toString(),
                        kidsEventPosterUrl: _kidsEvent.posterUrl,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        KidsEventDetailPage.routName,
                        arguments: _kidsEvent,
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
