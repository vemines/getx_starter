// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/post/bindings/post_binding.dart';
import '../modules/post/views/post_view.dart';
import '../modules/post/views/posts_view.dart';
import '../modules/preview/preview.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.preview;

  static final routes = [
    GetPage(
      name: _Paths.posts,
      page: () => const PostsView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.post,
      page: () => const PostView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.preview,
      page: () => const PreviewScreen(),
    ),
  ];
}
