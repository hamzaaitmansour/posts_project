import 'package:dartz/dartz.dart';
import 'package:posts_project/features/posts/domain/repositories/post_repo.dart';

import '../../../../core/error/failure.dart';
import '../entities/post.dart';

class UpdatePostUseCase {
  final PostRepo postRepo;

  UpdatePostUseCase(this.postRepo);

  Future<Either<Failure,Unit>> call(Post post){
    return postRepo.updatePost(post);
  }
}