import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/pages/announcement_list.dart';
import 'package:len_afisha/pages/home.dart';
import 'package:len_afisha/pages/information.dart';
import 'package:len_afisha/pages/kids_event_detail.dart';
import 'package:len_afisha/pages/movie_detail.dart';
import 'package:len_afisha/pages/movie_poster.dart';
import 'package:len_afisha/pages/overview.dart';
import 'package:len_afisha/pages/rdk_events_detail.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<EventsData>(
    create: (context) => EventsData(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OverviewPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routName:
            return MaterialPageRoute(
              builder: (ctx) => const HomePage(),
              settings: settings,
            );
            break;
          case MovieDetailPage.routName:
            return PageTransition(
              child: const MovieDetailPage(),
              type: PageTransitionType.rightToLeftWithFade,
              settings: settings,
            );
            break;
          case KidsEventDetailPage.routName:
            return PageTransition(
              child: const KidsEventDetailPage(),
              type: PageTransitionType.rightToLeftWithFade,
              settings: settings,
            );
            break;
          case RdkEventDetailPage.routName:
            return PageTransition(
              child: const RdkEventDetailPage(),
              type: PageTransitionType.rightToLeftWithFade,
              settings: settings,
            );
            break;
          case MoviePosterPage.routName:
            return PageTransition(
              child: const MoviePosterPage(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          case InformationPage.routName:
            return MaterialPageRoute(
              builder: (ctx) => const InformationPage(),
              settings: settings,
            );
            break;
          case AnnouncementListPage.routName:
            return MaterialPageRoute(
              builder: (ctx) => const AnnouncementListPage(),
              settings: settings,
            );
            break;
          default:
            return MaterialPageRoute(
              builder: (ctx) => const HomePage(),
              settings: settings,
            );
        }
      },
      title: 'Афиша РДК',
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primarySwatch: Colors.blue,
      ),
    );
  }
}
