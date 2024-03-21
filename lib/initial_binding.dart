import 'package:get/get.dart';

import 'app/data/repositories/post_repository.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // permanent: true prevert delete drom memory
    Get.put<PostRepository>(PostRepository.instance, permanent: true);
  }
}
