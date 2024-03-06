import 'package:hive/hive.dart';

import '../../data/models/post_model.dart';
// import 'package:path_provider/path_provider.dart';

class HiveStorageHelper {
  HiveStorageHelper._();
  static final HiveStorageHelper _instance = HiveStorageHelper._();
  static HiveStorageHelper get instance => _instance;
  final String defaultBox = 'storage';

  Future<void> init() async {
    // if android
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    // Hive.init(appDocumentDir.path);
    await Hive.openBox(defaultBox);
    if (!Hive.isAdapterRegistered(PostAdapter().typeId)) {
      Hive.registerAdapter(PostAdapter());
    }
  }

  Future<void> put(String key, dynamic value, String? box) async {
    await Hive.box(box ?? defaultBox).put(key, value);
  }

  dynamic get(String key, String? box) {
    return Hive.box(box ?? defaultBox).get(key);
  }

  Future<void> remove(String key, String? box) async {
    await Hive.box(box ?? defaultBox).delete(key);
  }
}
