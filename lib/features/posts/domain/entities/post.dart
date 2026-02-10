import 'package:equatable/equatable.dart';

class Post extends Equatable{
  int id ;
  String title ;
  String body ;
  Post(this.id, this.title, this.body);

  @override
  // TODO: implement props
  List<Object?> get props => [id , title , body];
}