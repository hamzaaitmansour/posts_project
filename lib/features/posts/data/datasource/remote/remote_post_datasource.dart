import 'package:dartz/dartz.dart';
import 'package:posts_project/features/posts/data/models/post_model.dart';

abstract class RemotePostDatasource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int id);
  Future<Unit> updatePost(PostModel post);
  Future<Unit> addPost(PostModel post);
}
