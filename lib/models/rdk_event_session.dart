import '../values/constants.dart' as constants;

class RdkEventSession {
  String id;
  String weekDay;
  String month;
  int differenceInMinutes;
  final DateTime _today = DateTime.now();
  DateTime dateTime;

  RdkEventSession(
      {this.id,
      this.dateTime,
      this.weekDay,
      this.month,
      this.differenceInMinutes});

      RdkEventSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = DateTime.parse(json['dateTime']);
    weekDay = constants.weekDays[dateTime.weekday - 1];
    month = constants.months[dateTime.month - 1];
    differenceInMinutes = dateTime.difference(_today).inMinutes;
  }
}