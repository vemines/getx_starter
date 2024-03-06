import 'package:get/get.dart';

class PostProvider extends GetConnect {
  // Make it singleton and let root bindings put it
  PostProvider._();
  static final instance = PostProvider._();

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

  Future<Response<dynamic>> fetchPosts() => get("/posts");
  Future<Response<dynamic>> fetchPost(String id) => get("/posts/$id");
}
