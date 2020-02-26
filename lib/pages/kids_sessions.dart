import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/models/kids_event_session.dart';
import 'package:len_afisha/widgets/kids_sessions_list_item.dart';
import 'package:provider/provider.dart';

class KidsSessionsPage extends StatelessWidget {
  static const routName = 'kids-sessions-page';
  const KidsSessionsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsData>(
      builder: (context, eventsData, child) {
        return BuildKidsSessionsListView(eventsData: eventsData);
      },
    );
  }
}

class BuildKidsSessionsListView extends StatelessWidget {
  const BuildKidsSessionsListView({
    Key key,
    @required EventsData eventsData,
  })  : _eventsData = eventsData,
        super(key: key);

  final EventsData _eventsData;

  @override
  Widget build(BuildContext context) {
    final List<KidsEventSession> _sessions = _eventsData.kidsEventsSessions;
    final int _listViewLength = _sessions.length;
    return ListView.builder(
      itemCount: _listViewLength,
      itemBuilder: (BuildContext context, int index) {
        final _kidsEvent = _eventsData.findKidsEventById(_sessions[index].id);
        return Column(
          children: <Widget>[
            InkWell(
              splashColor: Colors.white,
              child: Card(
                elevation: 5.0,
                child: KidsSessionsListItem(
                  kidsEventTitle: _kidsEvent.title,
                  kidsEventDay: _sessions[index].dateTime.day.toString(),
                  kidsEventMonth: _sessions[index].month,
                  kidsEventWeekDay: _sessions[index].weekDay,
                  kidsEventTime:
                      _sessions[index].dateTime.toString().substring(11, 16),
                  kidsEventDuration: _kidsEvent.duration,
                  kidsEventAgeRating: _kidsEvent.ageRating.toString(),
                ),
              ),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}
