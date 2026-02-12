// lib/core/dependency_injection.dart
import 'package:get_it/get_it.dart';
import 'package:posts_project/core/network/connection_checker.dart';
import 'package:posts_project/core/network/dio_config.dart';
import 'package:posts_project/features/posts/data/datasource/remote/remote_post_datasource.dart';
import 'package:posts_project/features/posts/data/datasource/remote/remote_post_datasource_impl.dart';
import 'package:posts_project/features/posts/domain/repositories/post_repo.dart';
//import 'package:posts_project/features/posts/domain/usecases/delete_post.dart';
import 'package:posts_project/features/posts/domain/usecases/get_all_posts.dart';
import 'package:posts_project/features/posts/presentation/controller/posts_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/posts/data/datasource/local/local_post_datasource.dart';
import '../features/posts/data/datasource/local/local_post_datasource_impl.dart';
import '../features/posts/data/repositories/post_repo_impl.dart';
import '../features/posts/domain/usecases/delete_post_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Core
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => ConnectionChecker());

  // Data Sources
  sl.registerLazySingleton<LocalPostDatasource>(
        () => LocalPostDatasourceImpl(sl()),
  );

  sl.registerLazySingleton<RemotePostDatasource>(
        () => RemotePostDatasourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<PostRepo>(
        () => PostRepoImpl(
      remotePostDatasource: sl(),
      localPostDatasource: sl(),
      conChecker: sl(),
    ),
  );

  // ✅ Use Cases
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl())); // ✅ Added

  // ✅ Provider
  sl.registerFactory(
        () => PostsProvider(
      getAllPostsUseCase: sl(),
      deletePostUseCase: sl(), // ✅ Added
    ),
  );
}