import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/post_model.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post, this.openPost = false});
  final PostModel post;
  final bool openPost;

  @override
  Widget build(BuildContext context) {
    // print(post.id); // example how listview work vs column with 100 post widget
    final TextTheme textTheme = context.textTheme;
    return ListTile(
      leading: Text(
        post.id?.toString() ?? 'No userId',
        style: textTheme.bodyMedium,
      ),
      title: Text(
        "${post.userId?.toString() ?? 'No userId'} - ${post.title ?? 'No title'}",
        style: textTheme.headlineSmall,
      ),
      subtitle: Text(
        post.body ?? 'No body',
        style: textTheme.bodyLarge,
      ),
      onTap: openPost ? () => Get.toNamed("/post/${post.id}") : null,
    );
  }
}
