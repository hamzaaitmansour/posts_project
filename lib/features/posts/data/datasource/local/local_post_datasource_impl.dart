import 'package:dartz/dartz.dart';
import 'package:posts_project/core/error/failure.dart';
import 'package:posts_project/features/posts/data/datasource/local/local_post_datasource.dart';
import 'package:posts_project/features/posts/data/models/post_model.dart';

class LocalPostDatasourceImpl implements LocalPostDatasource {
  @override
  Future<Either<Failure, Unit>> cachedPosts(List<PostModel> posts) {
    // TODO: implement cachedPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PostModel>>> getAllCached() {
    // TODO: implement getAllCached
    throw UnimplementedError();
  }

}