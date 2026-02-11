import 'package:dartz/dartz.dart';
import 'package:posts_project/core/error/failure.dart';
import 'package:posts_project/features/posts/data/datasource/remote/remote_post_datasource.dart';
import 'package:posts_project/features/posts/data/models/post_model.dart';

class RemotePostDatasourceImpl implements RemotePostDatasource {
  @override
  Future<Unit> addPost(PostModel post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
  
  
}