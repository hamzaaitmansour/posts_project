import 'package:dartz/dartz.dart';
import 'package:posts_project/core/error/exceptions.dart';
import 'package:posts_project/core/error/failure.dart';
import 'package:posts_project/core/network/connection_checker.dart';
import 'package:posts_project/features/posts/data/datasource/local/local_post_datasource.dart';
import 'package:posts_project/features/posts/data/datasource/remote/remote_post_datasource.dart';
import 'package:posts_project/features/posts/data/models/post_model.dart';
import 'package:posts_project/features/posts/domain/entities/post.dart';
import 'package:posts_project/features/posts/domain/repositories/post_repo.dart';
class PostRepoImpl extends PostRepo {
  final ConnectionChecker conChecker;
  final RemotePostDatasource remotePostDatasource;
  final LocalPostDatasource localPostDatasource;

  PostRepoImpl({
    required this.remotePostDatasource,
    required this.localPostDatasource,
    required this.conChecker,
  });

  // ================= GET ALL POSTS =================

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await conChecker.isConnected()) {
      try {
        final remotePosts =
        await remotePostDatasource.getAllPosts(); // List<PostModel>

        await localPostDatasource.cachedPosts(remotePosts);

        return Right(remotePosts); // PostModel extends Post
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts =
        await localPostDatasource.getAllCached();

        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }


  // ================= ADD =================

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    return executeQuery(() async {
      return await remotePostDatasource.addPost(
        PostModel(post.id, post.title, post.body),
      );
    });
  }

  // ================= DELETE =================

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    return executeQuery(() async {
      return await remotePostDatasource.deletePost(id);
    });
  }

  // ================= UPDATE =================

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    return executeQuery(() async {
      return await remotePostDatasource.updatePost(
        PostModel(post.id, post.title, post.body),
      );
    });
  }

  // ================= SHARED EXECUTOR =================

  Future<Either<Failure, Unit>> executeQuery(
      Future<Unit> Function() execute) async {
    if (await conChecker.isConnected()) {
      try {
        await execute();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
