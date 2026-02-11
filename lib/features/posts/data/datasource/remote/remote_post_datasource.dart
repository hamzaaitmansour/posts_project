import 'package:dartz/dartz.dart';
import 'package:posts_project/features/posts/data/models/post_model.dart';

import '../../../../../core/error/failure.dart';

abstract class RemotePostDatasource {
  Future<Either<Failure,List<PostModel>>> getAllPosts();
  Future<Either<Failure,Unit>> deletePost(int id );
  Future<Either<Failure,Unit>> updatePost(PostModel post);
  Future<Either<Failure,Unit>> addPost(PostModel post);
}