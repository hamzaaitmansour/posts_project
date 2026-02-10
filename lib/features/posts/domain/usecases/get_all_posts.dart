import 'package:dartz/dartz.dart';
import 'package:posts_project/features/posts/domain/repositories/post_repo.dart';

import '../../../../core/error/failure.dart';
import '../entities/post.dart';

class GetAllPostsUseCase {
  final PostRepo postRepo;

  GetAllPostsUseCase(this.postRepo);

  Future<Either<Failure,List<Post>>> call(){
    return postRepo.getAllPosts();
  }
}