part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const posts = _Paths.posts;
  static const post = _Paths.post;
  static const preview = _Paths.preview;
}

abstract class _Paths {
  _Paths._();
  static const posts = '/posts/all';
  static const post = '/post/:id';
  static const preview = '/preview';
}
