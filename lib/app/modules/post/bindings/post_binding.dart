import 'package:get/get.dart';

import '../../../data/repositories/post_repository.dart';
import '../controllers/post_controller.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController());
    // permanent: true prevert delete drom memory
    Get.put<PostRepository>(PostRepository.instance, permanent: true);
  }
}
