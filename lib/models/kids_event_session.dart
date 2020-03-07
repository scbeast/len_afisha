import '../values/constants.dart' as constants;

class KidsEventSession {
  String id;
  String weekDay;
  String month;
  int differenceInMinutes;
  final DateTime _today = DateTime.now();
  DateTime dateTime;

  KidsEventSession(
      {this.id,
      this.dateTime,
      this.weekDay,
      this.month,
      this.differenceInMinutes});

      KidsEventSession.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    dateTime = DateTime.parse(json['dateTime'] as String);
    weekDay = constants.weekDays[dateTime.weekday - 1];
    month = constants.months[dateTime.month - 1];
    differenceInMinutes = dateTime.difference(_today).inMinutes;
  }
}
