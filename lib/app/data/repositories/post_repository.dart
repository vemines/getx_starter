import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/post_model.dart';
import '../providers/post_provider.dart';

class PostRepository {
  String postKey = "posts";

  Future<List<PostModel>> fetchAllPosts() async {
    var box = await Hive.openBox<PostModel>(postKey);
    // test cache object with hive

    if (box.values.isNotEmpty) {
      return box.values.toList();
    }

    final response = await PostProvider.instance.fetchPosts();
    if (response.statusCode == 200) {
      final body = response.bodyString!;
      // Convert body to list posts
      final List<dynamic> jsonList = json.decode(body);
      final List<PostModel> posts = jsonList.map((i) {
        final model = PostModel.fromJson(i);
        // add model to hive
        box.add(model);

        return model;
      }).toList();
      // If the request is successful, return the list of PostModel
      return posts;
    } else {
      // If the request is not successful, throw an error
      throw Exception('Failed to load post');
    }
  }

  Future<PostModel?> fetchOnePost(String id) async {
    // var box = await Hive.openBox<PostModel>("post/$id");
    // // test cache object with hive
    // if (!Hive.isAdapterRegistered(PostAdapter().typeId)) {
    //   Hive.registerAdapter(PostAdapter());
    // }

    // if (box.values.isNotEmpty) {
    //   return box.values.last;
    // }

    final response = await PostProvider.instance.fetchPost(id);
    if (response.statusCode == 200) {
      final body = response.bodyString!;
      // Convert body to list posts
      final PostModel post = PostModel.fromJson(json.decode(body));
      // box.add(post);
      // If the request is successful, return PostModel
      return post;
    } else {
      // If the request is not successful, return null
      return null;
    }
  }
}
