// lib/features/posts/presentation/controller/posts_provider.dart
import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';
//import '../../domain/usecases/delete_post.dart';
import '../../domain/usecases/delete_post_usecase.dart';
import '../../domain/usecases/get_all_posts.dart';

class PostsProvider extends ChangeNotifier {
  final GetAllPostsUseCase getAllPostsUseCase;
  final DeletePostUseCase deletePostUseCase;

  PostsProvider({
    required this.getAllPostsUseCase,
    required this.deletePostUseCase,
  });

  bool isLoading = false;
  List<Post> posts = [];
  String? error;

  // ✅ Fetch all posts
  Future<void> fetchPosts() async {
    isLoading = true;
    error = null; // ✅ Clear previous errors
    notifyListeners();

    final result = await getAllPostsUseCase();

    result.fold(
          (failure) {
        error = "Error fetching posts";
        isLoading = false;
        notifyListeners();
      },
          (data) {
        posts = data;
        isLoading = false;
        notifyListeners();
      },
    );
  }

  // ✅ Delete post
  Future<void> deletePost(int id) async {
    final result = await deletePostUseCase(id);

    result.fold(
          (failure) {
        error = "Error deleting post";
        notifyListeners();
      },
          (unit) {
        // ✅ Remove post from local list
        posts.removeWhere((post) => post.id == id);
        notifyListeners();
      },
    );
  }
}