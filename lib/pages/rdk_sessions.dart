import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/models/rdk_event_session.dart';
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
          return IAmBusyNowIndicator();
        } else {
          return BuildRdkSessionsListView(eventsData: eventsData);
        }
      },
    );
  }
}

class BuildRdkSessionsListView extends StatelessWidget {
  const BuildRdkSessionsListView({
    Key key,
    @required EventsData eventsData,
  })  : _eventsData = eventsData,
        super(key: key);

  final EventsData _eventsData;

  @override
  Widget build(BuildContext context) {
    final List<RdkEventSession> _sessions = _eventsData.rdkEventsSessions;
    final int _listViewLength = _sessions.length;
    if (_listViewLength == 0) {
      return EmptyEventsListWidget();
    } else {
      return ListView.builder(
        itemCount: _listViewLength,
        itemBuilder: (BuildContext context, int index) {
          final _rdkEvent = _eventsData.findRdkEventById(_sessions[index].id);
          return InkWell(
            splashColor: Colors.white,
            child: Card(
              elevation: 5.0,
              child: RdkEventsSessionsListItem(
                rdkEventTitle: _rdkEvent.title,
                rdkEventDay: _sessions[index].dateTime.day.toString(),
                rdkEventMonth: _sessions[index].month,
                rdkEventWeekDay: _sessions[index].weekDay,
                rdkEventTime:
                    _sessions[index].dateTime.toString().substring(11, 16),
                rdkEventDuration: _rdkEvent.duration,
                rdkEventAgeRating: _rdkEvent.ageRating.toString(),
              ),
            ),
            onTap: () {},
          );
        },
      );
    }
  }
}
