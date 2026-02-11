import 'package:posts_project/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel(super.id, super.title, super.body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(json['id'], json['title'], json['body']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
