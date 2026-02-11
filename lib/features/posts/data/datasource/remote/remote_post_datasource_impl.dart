import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:posts_project/core/error/exceptions.dart';
import 'package:posts_project/core/error/failure.dart';
import 'package:posts_project/core/network/dio_config.dart';
import 'package:posts_project/features/posts/data/datasource/remote/remote_post_datasource.dart';
import 'package:posts_project/features/posts/data/models/post_model.dart';

class RemotePostDatasourceImpl implements RemotePostDatasource {

final DioClient dioClient;

  RemotePostDatasourceImpl(this.dioClient);
  @override
  Future<List<PostModel>> getAllPosts() async {
   final Response response = await dioClient.dio.get("/posts/");
   if(response.statusCode==200)
     {
      final List lists= response.data;
      final List<PostModel> posts = lists.map((e)=>PostModel.fromJson(e)).toList();
      return Future.value(posts);
     }
   else
     throw ServerException();

  }

  @override
  Future<Unit> addPost(PostModel post) async{
    final Response response = await dioClient.dio.post("/posts/",data:post.toJson());
    if(response.statusCode==201)
    {
      return unit;
    }
    else
      throw ServerException();
  }

  @override
  Future<Unit> deletePost(int id) async{
    final Response response = await dioClient.dio.delete("/posts/$id");
    if(response.statusCode==204)
    {
      return unit;
    }
    else
      throw ServerException();
  }



  @override
  Future<Unit> updatePost(PostModel post) async {
    final Response response = await dioClient.dio.put("/posts/"+post.id.toString(),data:post.toJson());
    if(response.statusCode==200)
    {
      return unit;
    }
    else
      throw ServerException();
  }
  
  
}