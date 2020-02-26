import '../values/constants.dart' as constants;

class MovieSession {
  String id;
  String dayOfWeek;
  String month;
  int differenceInMinutes;
  final DateTime _today = DateTime.now();
  DateTime dateTime;

  MovieSession(
      {this.id,
      this.dateTime,
      this.dayOfWeek,
      this.month,
      this.differenceInMinutes});

  MovieSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = DateTime.parse(json['dateTime']);
    dayOfWeek = constants.weekDays[dateTime.weekday - 1];
    month = constants.months[dateTime.month - 1];
    differenceInMinutes = dateTime.difference(_today).inMinutes;
  }
}
