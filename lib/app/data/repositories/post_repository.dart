import 'dart:convert';

import 'package:get/get_connect.dart';

import '../models/post_model.dart';

class PostRepository extends GetConnect {
  // Make it singleton and let root bindings put it and make permanent: true
  PostRepository._();
  static final instance = PostRepository._();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "https://jsonplaceholder.typicode.com";

    httpClient.addRequestModifier<void>((request) async {
      request.headers['content-type'] = 'application/json';
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      return response;
    });
  }

  final String postKey = "posts";
  Future<List<PostModel>> fetchAllPosts() async {
    final response = await get("/posts");
    if (response.statusCode == 200) {
      final body = response.bodyString!;
      // Convert body to list posts
      final List<dynamic> jsonList = json.decode(body);
      final List<PostModel> posts = jsonList.map((i) {
        final model = PostModel.fromJson(i);
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
    final response = await httpClient.get("/posts/$id");
    if (response.statusCode == 200) {
      final body = response.bodyString!;
      // Convert body to list posts
      final PostModel post = PostModel.fromJson(json.decode(body));
      // If the request is successful, return PostModel
      return post;
    } else {
      // If the request is not successful, return null
      return null;
    }
  }
}
