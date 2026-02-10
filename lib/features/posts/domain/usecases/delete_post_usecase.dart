import 'package:dartz/dartz.dart';
import 'package:posts_project/features/posts/domain/repositories/post_repo.dart';

import '../../../../core/error/failure.dart';

class DeletePostUseCase {
  final PostRepo postRepo;

  DeletePostUseCase(this.postRepo);

  Future<Either<Failure,Unit>> call(int id ){
    return postRepo.deletePost(id);
  }
}