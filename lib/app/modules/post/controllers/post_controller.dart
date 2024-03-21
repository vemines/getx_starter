import 'package:get/get.dart';

import '../../../data/models/post_model.dart';
import '../../../data/repositories/post_repository.dart';

class PostController extends GetxController {
  PostRepository postRepository = PostRepository.instance;
  RxList<PostModel> posts = <PostModel>[].obs;
  Rxn<PostModel> post = Rxn<PostModel>();

  Future<void> loadPosts() async {
    final result = await postRepository.fetchAllPosts();
    if (result.isNotEmpty) posts.value = result;
  }

  Future<void> loadPost(String id) async {
    post = Rxn<PostModel>();
    final result = await postRepository.fetchOnePost(id);
    post.value = result;
  }
}
