import 'package:dartz/dartz.dart';
import 'package:posts_project/features/posts/domain/entities/post.dart';

import '../../../../core/error/failure.dart';

abstract class PostRepo {
  Future<Either<Failure,List<Post>>> getAllPosts();
  Future<Either<Failure,Unit>> deletePost(int id );
  Future<Either<Failure,Unit>> updatePost(Post post);
  Future<Either<Failure,Unit>> addPost(Post post);

}