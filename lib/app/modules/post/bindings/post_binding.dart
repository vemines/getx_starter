import 'package:get/get.dart';

import '../../../data/providers/post_provider.dart';
import '../controllers/post_controller.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController());
    // permanent: true prevert delete drom memory
    Get.put<PostProvider>(PostProvider.instance, permanent: true);
  }
}
