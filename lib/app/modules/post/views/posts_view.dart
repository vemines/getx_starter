import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/post_controller.dart';
import 'widgets/post.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  PostController controller = Get.find<PostController>();
  @override
  void initState() {
    super.initState();
    controller.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.toNamed(Routes.preview),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => PostWidget(
            post: controller.posts[index],
            openPost: true,
          ),
          itemCount: controller.posts.length,
        ),
      ),
    );
  }
}
