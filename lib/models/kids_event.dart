class KidsEvent {
  String id;
  String title;
  String synopsis;
  String duration;
  String posterUrl;
  int ageRating;

  KidsEvent({
    this.id,
    this.title,
    this.synopsis,
    this.duration,
    this.ageRating,
    this.posterUrl,
  });

  KidsEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    title = json['title'] as String;
    synopsis = json['synopsis'] as String;
    duration = json['duration'] as String;
    posterUrl = json['posterUrl'] as String;
    ageRating = json['age'] as int;
  }
}
