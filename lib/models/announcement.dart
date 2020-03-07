class Announcement {
  String id;
  String title;
  String subtitle;
  String synopsis;

  Announcement({
    this.id,
    this.title,
    this.subtitle,
    this.synopsis,
  });

  Announcement.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    title = json['title'] as String;
    subtitle = json['subtitle'] as String;
    synopsis = json['synopsis'] as String;
  }
}