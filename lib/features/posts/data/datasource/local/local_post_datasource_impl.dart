// lib/features/posts/data/datasources/local/local_post_datasource_impl.dart
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:posts_project/core/error/exceptions.dart';
import 'package:posts_project/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_post_datasource.dart';

class LocalPostDatasourceImpl implements LocalPostDatasource {
  final SharedPreferences sharedPreferences;

  LocalPostDatasourceImpl(this.sharedPreferences);

  @override
  Future<Unit> cachedPosts(List<PostModel> posts) async {
    List jsonPostModels =
    posts.map<Map<String, dynamic>>((post) => post.toJson()).toList();
    await sharedPreferences.setString("CACHED_POSTS", jsonEncode(jsonPostModels));
    return unit;
  }

  @override
  Future<List<PostModel>> getAllCached() async {
    String? jsonPosts = sharedPreferences.getString("CACHED_POSTS");

    if (jsonPosts == null) {
      throw EmptyCacheException();
    }

    List jsonPostsList = jsonDecode(jsonPosts);
    List<PostModel> postsModels =
    jsonPostsList.map((e) => PostModel.fromJson(e)).toList();
    return postsModels;
  }
}