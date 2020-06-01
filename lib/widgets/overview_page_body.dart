import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/widgets/announcement_list_tile.dart';
import 'package:len_afisha/widgets/carousel_slider_movie-posters.dart';

class OverviewPageBody extends StatelessWidget {
  final EventsData eventsData;
  const OverviewPageBody({
    Key key,
    @required this.eventsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _listViewLength = eventsData.announcements.length;
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 20.0),
                    child: Text(
                      'в прокате:',
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                  CarouselSliderMoviePosters(
                    eventsData: eventsData,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 8.0),
                    child: Text(
                      'что еще:',
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnnouncementsListTile(
                    announcementTitle: eventsData.announcements[index].title,
                    announcementSubtitle:
                        eventsData.announcements[index].subtitle,
                    announcementSynopsis:
                        eventsData.announcements[index].synopsis,
                  );
                },
                childCount: _listViewLength,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
