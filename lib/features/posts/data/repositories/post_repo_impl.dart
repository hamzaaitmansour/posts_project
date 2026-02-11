import 'package:dartz/dartz.dart';
import 'package:posts_project/core/error/exceptions.dart';
import 'package:posts_project/core/error/failure.dart';
import 'package:posts_project/core/network/connection_checker.dart';
import 'package:posts_project/features/posts/data/datasource/local/local_post_datasource.dart';
import 'package:posts_project/features/posts/data/datasource/remote/remote_post_datasource.dart';
import 'package:posts_project/features/posts/data/models/post_model.dart';
import 'package:posts_project/features/posts/domain/entities/post.dart';
import 'package:posts_project/features/posts/domain/repositories/post_repo.dart';

final isConnected = ConnectionCheker.isConnected();

class PostRepoImpl extends PostRepo {
  final RemotePostDatasource remotePostDatasource;
  final LocalPostDatasource localPostDatasource;

  PostRepoImpl({
    required this.remotePostDatasource,
    required this.localPostDatasource,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await isConnected) {
      try {
        final remotePostsEither = await remotePostDatasource.getAllPosts();

        if (remotePostsEither.isRight()) {
          final postsList = remotePostsEither.getOrElse(() => []);
          await localPostDatasource.cachedPosts(postsList);
        }

        return remotePostsEither;
      } on ServerException {
        return Left<Failure, List<Post>>(ServerFailure());
      }
    } else {
      try {
        return await localPostDatasource.getAllCached();
      } on EmptyCacheException {
        return Left<Failure, List<Post>>(EmptyCacheFailure());
      }
    }
  }


  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
