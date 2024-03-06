import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class PostModel {
  @HiveField(0)
  int? userId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? title;
  @HiveField(3)
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

class PostAdapter extends TypeAdapter<PostModel> {
  @override
  int get typeId => 1;

  @override
  PostModel read(BinaryReader reader) {
    int numOfFields = reader.readByte();
    Map fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return PostModel(
      userId: fields[0],
      id: fields[1],
      title: fields[2],
      body: fields[3],
    );
  }

  @override
  void write(BinaryWriter writer, PostModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.body);
  }
}
