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

  EventsData({this.movies, this.moviesSessions, this.announcements});

  void addMoviesFromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = new List<Movie>();
      json['movies'].forEach(
        (v) {
          movies.add(new Movie.fromJson(v));
        },
      );
    }
  }

  void addRdkEventsFromJson(Map<String, dynamic> json) {
    if (json['rdkEvents'] != null) {
      rdkEvents = new List<RdkEvent>();
      json['rdkEvents'].forEach(
        (v) {
          rdkEvents.add(new RdkEvent.fromJson(v));
        },
      );
    }
  }

  void addKidsEventsFromJson(Map<String, dynamic> json) {
    if (json['kidsEvents'] != null) {
      kidsEvents = new List<KidsEvent>();
      json['kidsEvents'].forEach(
        (v) {
          kidsEvents.add(new KidsEvent.fromJson(v));
        },
      );
    }
  }

  void addAnnouncementsFromJson(Map<String, dynamic> json) {
    if (json['announcements'] != null) {
      announcements = new List<Announcement>();
      json['announcements'].forEach(
        (v) {
          announcements.add(new Announcement.fromJson(v));
        },
      );
    }
  }

  void addMoviesSessionsFromJson(Map<String, dynamic> json) {
    if (json['moviesSessions'] != null) {
      moviesSessions = new List<MovieSession>();
      json['moviesSessions'].forEach(
        (v) {
          if (MovieSession.fromJson(v).differenceInMinutes >= -1) {
            moviesSessions.add(new MovieSession.fromJson(v));
          }
        },
      );
    }
  }

  void addKidsEventsSessionsFromJson(Map<String, dynamic> json) {
    if (json['kidsSessions'] != null) {
      kidsEventsSessions = new List<KidsEventSession>();
      json['kidsSessions'].forEach(
        (v) {
          if (KidsEventSession.fromJson(v).differenceInMinutes >= -1) {
            kidsEventsSessions.add(new KidsEventSession.fromJson(v));
          }
        },
      );
    }
  }

  void addRdkEventsSessionsFromJson(Map<String, dynamic> json) {
    if (json['rdkSessions'] != null) {
      rdkEventsSessions = new List<RdkEventSession>();
      json['rdkSessions'].forEach(
        (v) {
          if (RdkEventSession.fromJson(v).differenceInMinutes >= -1) {
            rdkEventsSessions.add(new RdkEventSession.fromJson(v));
          }
        },
      );
    }
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
    const String url = 'https://api.npoint.io/677b0e848d129c690d14';

    try {
      final response = await http.get(url);
      addEventsDataFromJson(jsonDecode(response.body));

// Подтягиваем рейтинги для каждого фильма
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
                    _json['rating']['imdb_rating']['num_vote'];
              }
            } catch (e) {
              f.imdbRatingNumberOfVotes = '-';
            }
            try {
              if (_json['rating']['imdb_rating']['\$t'] == '0') {
                f.imdbRating = '-';
              } else {
                f.imdbRating = _json['rating']['imdb_rating']['\$t'];
              }
            } catch (e) {
              f.imdbRating = '-';
            }
            try {
              if (_json['rating']['kp_rating']['num_vote'] == '0') {
                f.kpRatingNumberOfVotes = '-';
              } else {
                f.kpRatingNumberOfVotes =
                    _json['rating']['kp_rating']['num_vote'];
              }
            } catch (e) {
              f.kpRatingNumberOfVotes = '-';
            }
            try {
              if (_json['rating']['kp_rating']['\$t'] == '0') {
                f.kpRating = '-';
              } else {
                f.kpRating = _json['rating']['kp_rating']['\$t'];
              }
            } catch (e) {
              f.kpRating = '-';
            }
          } catch (error) {
// TODO: Добавить обработчик ошибки.
            print(error.toString());
          }
        },
      );
      iAmBusyNow = false;
      notifyListeners();
    } catch (error) {
// TODO: Добавить обработчик ошибки.
      print(error.toString());
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
