import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/pages/home.dart';
import 'package:len_afisha/pages/information.dart';
import 'package:len_afisha/pages/movie_detail.dart';
import 'package:len_afisha/pages/movie_poster.dart';
import 'package:len_afisha/pages/movies_sessions.dart';
import 'package:len_afisha/pages/overview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<EventsData>(
    create: (context) => EventsData(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OverviewPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routName:
            return MaterialPageRoute(
              builder: (ctx) => HomePage(),
              settings: settings,
            );
            break;
          case MoviesSessionsPage.routName:
            return MaterialPageRoute(
              builder: (ctx) => MoviesSessionsPage(),
              settings: settings,
            );
            break;
          case MovieDetailPage.routName:
            return PageTransition(
              child: MovieDetailPage(),
              type: PageTransitionType.rightToLeftWithFade,
              settings: settings,
            );
            break;
          case MoviePosterPage.routName:
            return PageTransition(
              child: MoviePosterPage(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          case InformationPage.routName:
            return MaterialPageRoute(
              builder: (ctx) => InformationPage(),
              settings: settings,
            );
            break;
          default:
            return MaterialPageRoute(
              builder: (ctx) => HomePage(),
              settings: settings,
            );
        }
      },

      // routes: {
      //   HomePage.routName: (ctx) => HomePage(),
      //   MoviesSessionsPage.routName: (ctx) => MoviesSessionsPage(),
      //   MovieDetailPage.routName: (ctx) => MovieDetailPage(),
      //   MoviePosterPage.routName: (ctx) => MoviePosterPage()
      // },
      title: 'Афиша РДК',
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primarySwatch: Colors.blue,
      ),
    );
  }
}
