class RdkEvent {
  String id;
  String title;
  String synopsis;
  String duration;
  int ageRating;

  RdkEvent({
    this.id,
    this.title,
    this.synopsis,
    this.duration,
    this.ageRating,
  });
  RdkEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    synopsis = json['synopsis'];
    duration = json['duration'];
    ageRating = json['age'];
  }
}
