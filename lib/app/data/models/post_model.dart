class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    try {
      userId = json["userId"];
      id = json["id"];
      title = json["title"];
      body = (json["body"] ?? []);
    } catch (e) {
      throw Exception('Failed to parse JSON to PostModel: $e');
    }
  }
}
