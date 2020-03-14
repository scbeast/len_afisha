import 'package:flutter/material.dart';
import 'package:len_afisha/models/movie_session.dart';
import 'package:len_afisha/pages/movie_detail.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/widgets/empty_events_list.dart';
import 'package:len_afisha/widgets/i_am_busy_now.dart';
import 'package:len_afisha/widgets/movie_list_item.dart';
import 'package:len_afisha/widgets/oops_dialog.dart';
import 'package:provider/provider.dart';

class MoviesSessionsPage extends StatelessWidget {
  static const routName = 'sessions-page';
  const MoviesSessionsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsData>(
      builder: (context, eventsData, _) {
        if (eventsData.iAmBusyNow) {
          return const IAmBusyNowIndicator();
        } else if (eventsData.oops) {
          return const OopsDialog();
        } else {
          return const BuildMoviesSessionsListView();
        }
      },
    );
  }
}

class BuildMoviesSessionsListView extends StatelessWidget {
  const BuildMoviesSessionsListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsData _eventsData = Provider.of<EventsData>(context);
    final List<MovieSession> _sessions = _eventsData.moviesSessions;
    if (_sessions.isEmpty) {
      return const EmptyEventsListWidget();
    } else {
      return ListView.builder(
        itemCount: _sessions.length,
        itemBuilder: (BuildContext context, int index) {
          final _movie = _eventsData.findMovieById(_sessions[index].id);
          return GestureDetector(
            child: Card(
              elevation: 5.0,
              child: MovieListItem(
                posterUrl: _movie.posterUrl,
                movieTitle: _movie.title,
                movieYear: _movie.year,
                movieCountry: _movie.country,
                movieDay: _sessions[index].dateTime.day.toString(),
                movieMonth: _sessions[index].month,
                movieDayOfWeek: _sessions[index].dayOfWeek,
                movieTime:
                    _sessions[index].dateTime.toString().substring(11, 16),
                movieDuration: _movie.duration,
                movieGenre: _movie.genre,
                movieAgeRating: _movie.ageRating.toString(),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                MovieDetailPage.routName,
                arguments: _movie,
              );
            },
          );
        },
      );
    }
  }
}
