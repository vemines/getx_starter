import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_starter/app/routes/app_pages.dart';
import '../../../data/models/post_model.dart';

import '../controllers/post_controller.dart';
import 'widgets/post.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  PostController controller = Get.find<PostController>();
  @override
  void initState() {
    super.initState();
    final String? id = Get.parameters["id"];
    if (id != null) controller.loadPost(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.toNamed(Routes.posts),
        ),
      ),
      body: Obx(
        () => controller.post.value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PostWidget(post: controller.post.value!),
      ),
    );
  }
}
