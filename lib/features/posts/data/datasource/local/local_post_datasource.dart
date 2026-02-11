import 'package:dartz/dartz.dart';
import 'package:posts_project/features/posts/data/models/post_model.dart';

import '../../../../../core/error/failure.dart';

abstract class LocalPostDatasource {
  Future<Either<Failure,List<PostModel>>> getAllCached();
  Future<Either<Failure,Unit>> cachedPosts(List<PostModel> posts);
}