import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/models/rdk_event_session.dart';
import 'package:len_afisha/pages/rdk_events_detail.dart';
import 'package:len_afisha/widgets/empty_events_list.dart';
import 'package:len_afisha/widgets/i_am_busy_now.dart';
import 'package:len_afisha/widgets/rdk_events_sessions_list_item.dart';
import 'package:provider/provider.dart';

class RdkSessionsPage extends StatelessWidget {
  static const routName = 'concerts-sessions-page';
  const RdkSessionsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsData>(
      builder: (context, eventsData, child) {
        if (eventsData.iAmBusyNow) {
          return const IAmBusyNowIndicator();
        } else {
          return const BuildRdkSessionsListView();
        }
      },
    );
  }
}

class BuildRdkSessionsListView extends StatelessWidget {
  const BuildRdkSessionsListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsData _eventsData = Provider.of<EventsData>(context);
    final List<RdkEventSession> _sessions = _eventsData.rdkEventsSessions;
    if (_sessions.isEmpty) {
      return const EmptyEventsListWidget();
    } else {
      return AnimationLimiter(
        child: ListView.builder(
          itemCount: _sessions.length,
          itemBuilder: (BuildContext context, int index) {
            final _rdkEvent = _eventsData.findRdkEventById(_sessions[index].id);
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 600),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: GestureDetector(
                    child: Card(
                      elevation: 5.0,
                      child: RdkEventsSessionsListItem(
                        rdkEventTitle: _rdkEvent.title,
                        rdkEventDay: _sessions[index].dateTime.day.toString(),
                        rdkEventMonth: _sessions[index].month,
                        rdkEventWeekDay: _sessions[index].weekDay,
                        rdkEventTime: _sessions[index]
                            .dateTime
                            .toString()
                            .substring(11, 16),
                        rdkEventDuration: _rdkEvent.duration,
                        rdkEventAgeRating: _rdkEvent.ageRating.toString(),
                        rdkEventPosterUrl: _rdkEvent.posterUrl,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RdkEventDetailPage.routName,
                        arguments: _rdkEvent,
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
