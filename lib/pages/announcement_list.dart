import 'package:flutter/material.dart';
import 'package:len_afisha/models/announcement.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/widgets/announcement_list_tile.dart';
import 'package:len_afisha/widgets/empty_events_list.dart';
import 'package:len_afisha/widgets/i_am_busy_now.dart';
import 'package:len_afisha/widgets/oops_dialog.dart';
import 'package:provider/provider.dart';

class AnnouncementListPage extends StatelessWidget {
  static const routName = 'announcement-list-page';
  const AnnouncementListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsData>(
      builder: (context, eventsData, _) {
        if (eventsData.iAmBusyNow) {
          return const IAmBusyNowIndicator();
        } else if (eventsData.oops) {
          return const OopsDialog();
        } else {
          return const BuildAnnouncementsListView();
        }
      },
    );
  }
}

class BuildAnnouncementsListView extends StatelessWidget {
  const BuildAnnouncementsListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsData _eventsData = Provider.of<EventsData>(context);
    final List<Announcement> _announcements = _eventsData.announcements;
    final int _listViewLength = _announcements.length;
    if (_announcements.isEmpty) {
      return const EmptyEventsListWidget();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'объявления',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: _listViewLength,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                elevation: 5.0,
                child: AnnouncementsListTile(
                  announcementTitle: _announcements[index].title,
                  announcementSubtitle: _announcements[index].subtitle,
                  announcementSynopsis: _announcements[index].synopsis,
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
