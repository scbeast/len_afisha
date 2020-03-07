import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/pages/home.dart';
import 'package:len_afisha/widgets/announcement_list_tile.dart';
import 'package:len_afisha/widgets/carousel_slider_movie-posters.dart';
import 'package:len_afisha/widgets/i_am_busy_now.dart';
import 'package:len_afisha/widgets/oops_dialog.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  static const routName = 'overview-page';

  const OverviewPage({Key key}) : super(key: key);

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<EventsData>(context).fetchEventsData();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BuildBottomAppBar(),
      appBar: AppBar(
        title: const Text(
          'главное',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<EventsData>(
        builder: (context, eventsData, child) {
          if (eventsData.iAmBusyNow) {
            return const IAmBusyNowIndicator(); //если данные загружаются
          } else if (eventsData.oops) {
            return const OopsDialog(); // если что-то пошло не так
          } else {
            return OverviewPageBody(
                eventsData: eventsData); //если всё нормально
          }
        },
      ),
    );
  }
}

class BuildBottomAppBar extends StatelessWidget {
  const BuildBottomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(style: BorderStyle.solid, color: Colors.blue),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            'далее',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.routName);
          },
        ),
      ),
    );
  }
}

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
