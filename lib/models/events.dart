import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:len_afisha/models/announcement.dart';
import 'package:len_afisha/models/kids_event.dart';
import 'package:len_afisha/models/kids_event_session.dart';
import 'package:len_afisha/models/movie.dart';
import 'package:len_afisha/models/movie_session.dart';
import 'package:len_afisha/models/rdk_event.dart';
import 'package:len_afisha/models/rdk_event_session.dart';
import 'package:xml2json/xml2json.dart';

class EventsData with ChangeNotifier {
  List<Movie> movies;
  List<RdkEvent> rdkEvents;
  List<Announcement> announcements;
  List<KidsEvent> kidsEvents;
  List<MovieSession> moviesSessions;
  List<KidsEventSession> kidsEventsSessions;
  List<RdkEventSession> rdkEventsSessions;

  bool iAmBusyNow = true;
  bool oops = false;
  bool _afterInit = false;

  EventsData({this.movies, this.moviesSessions, this.announcements});

  void addMoviesFromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = List<Movie>();
      json['movies'].forEach(
        (v) {
          movies.add(Movie.fromJson(v as Map<String, dynamic>));
        },
      );
    }
  }

  void addRdkEventsFromJson(Map<String, dynamic> json) {
    if (json['rdkEvents'] != null) {
      rdkEvents = List<RdkEvent>();
      json['rdkEvents'].forEach(
        (v) {
          rdkEvents.add(RdkEvent.fromJson(v as Map<String, dynamic>));
        },
      );
    }
  }

  void addKidsEventsFromJson(Map<String, dynamic> json) {
    if (json['kidsEvents'] != null) {
      kidsEvents = List<KidsEvent>();
      json['kidsEvents'].forEach(
        (v) {
          kidsEvents.add(KidsEvent.fromJson(v as Map<String, dynamic>));
        },
      );
    }
  }

  void addAnnouncementsFromJson(Map<String, dynamic> json) {
    if (json['announcements'] != null) {
      announcements = List<Announcement>();
      json['announcements'].forEach(
        (v) {
          announcements.add(Announcement.fromJson(v as Map<String, dynamic>));
        },
      );
    }
  }

  void addMoviesSessionsFromJson(Map<String, dynamic> json) {
    if (json['moviesSessions'] != null) {
      moviesSessions = List<MovieSession>();
      json['moviesSessions'].forEach(
        (v) {
          if (MovieSession.fromJson(v as Map<String, dynamic>)
                  .differenceInMinutes >=
              -1) {
            moviesSessions
                .add(MovieSession.fromJson(v as Map<String, dynamic>));
          }
        },
      );
    }
  }

  void addKidsEventsSessionsFromJson(Map<String, dynamic> json) {
    if (json['kidsSessions'] != null) {
      kidsEventsSessions = List<KidsEventSession>();
      json['kidsSessions'].forEach(
        (v) {
          if (KidsEventSession.fromJson(v as Map<String, dynamic>)
                  .differenceInMinutes >=
              -1) {
            kidsEventsSessions
                .add(KidsEventSession.fromJson(v as Map<String, dynamic>));
          }
        },
      );
    }
  }

  void addRdkEventsSessionsFromJson(Map<String, dynamic> json) {
    if (json['rdkSessions'] != null) {
      rdkEventsSessions = List<RdkEventSession>();
      json['rdkSessions'].forEach(
        (v) {
          if (RdkEventSession.fromJson(v as Map<String, dynamic>)
                  .differenceInMinutes >=
              -1) {
            rdkEventsSessions
                .add(RdkEventSession.fromJson(v as Map<String, dynamic>));
          }
        },
      );
    }
  }

  void _getMoviesRatings() {
    movies.forEach(
      (f) async {
        try {
          final Xml2Json myTransformer = Xml2Json();
          final movieRatingJson = await http.get(f.ratingUrl);
          myTransformer.parse(movieRatingJson.body);
          final _json = jsonDecode(myTransformer.toGData());
          try {
            if (_json['rating']['imdb_rating']['num_vote'] == '0') {
              f.imdbRatingNumberOfVotes = '-';
            } else {
              f.imdbRatingNumberOfVotes =
                  _json['rating']['imdb_rating']['num_vote'] as String;
            }
          } catch (e) {
            f.imdbRatingNumberOfVotes = '-';
          }
          try {
            if (_json['rating']['imdb_rating']['\$t'] == '0') {
              f.imdbRating = '-';
            } else {
              f.imdbRating = _json['rating']['imdb_rating']['\$t'] as String;
            }
          } catch (e) {
            f.imdbRating = '-';
          }
          try {
            if (_json['rating']['kp_rating']['num_vote'] == '0') {
              f.kpRatingNumberOfVotes = '-';
            } else {
              f.kpRatingNumberOfVotes =
                  _json['rating']['kp_rating']['num_vote'] as String;
            }
          } catch (e) {
            f.kpRatingNumberOfVotes = '-';
          }
          try {
            if (_json['rating']['kp_rating']['\$t'] == '0') {
              f.kpRating = '-';
            } else {
              f.kpRating = _json['rating']['kp_rating']['\$t'] as String;
            }
          } catch (e) {
            f.kpRating = '-';
          }
        } catch (error) {
          oops = true; //если ошибка
        }
      },
    );
  }

  void addEventsDataFromJson(Map<String, dynamic> json) {
    addAnnouncementsFromJson(json);
    addMoviesFromJson(json);
    addKidsEventsFromJson(json);
    addRdkEventsFromJson(json);

    addMoviesSessionsFromJson(json);
    addKidsEventsSessionsFromJson(json);
    addRdkEventsSessionsFromJson(json);
  }

// Получаем данные с сервера
  Future<void> fetchEventsData() async {
    const String url = 'https://api.npoint.io/755739f726d7e02d066d';
    if (_afterInit) {
      iAmBusyNow = true;
      notifyListeners();
    }
    _afterInit = true;
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        oops = true;
      } else {
        addEventsDataFromJson(
            jsonDecode(response.body) as Map<String, dynamic>);

        _getMoviesRatings(); // Подтягиваем рейтинги для каждого фильма
        iAmBusyNow = false;
        notifyListeners();
      }
    } catch (error) {
      oops = true; //если ошибка
    }
  }

  Movie findMovieById(String id) {
    return movies.firstWhere((movie) => movie.id == id);
  }

  KidsEvent findKidsEventById(String id) {
    return kidsEvents.firstWhere((kidsEvent) => kidsEvent.id == id);
  }

  RdkEvent findRdkEventById(String id) {
    return rdkEvents.firstWhere((rdkEvent) => rdkEvent.id == id);
  }
}
