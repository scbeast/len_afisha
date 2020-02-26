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
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    synopsis = json['synopsis'];
  }
}