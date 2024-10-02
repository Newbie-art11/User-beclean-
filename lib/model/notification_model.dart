class Notification {
  final int id;
  final String title;
  final String body;
  Notification({required this.id, required this.title, required this.body});
  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
        id: json['id'], title: json['title'], body: json['body']);
  }
}
