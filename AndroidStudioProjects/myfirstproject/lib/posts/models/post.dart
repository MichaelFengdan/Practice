
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

/**
 * 数据模型层
 */
class Post extends Equatable{
  final int id;
  final String title;
  final String body;


  Post({this.id, this.title, this.body});

  @override
  List<Object> get props => [id,title,body];

  @override
  String toString() {
    return 'Post{id: $id, title: $title, body: $body}';
  }
}