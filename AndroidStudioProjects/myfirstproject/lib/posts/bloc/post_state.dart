import 'package:equatable/equatable.dart';
import 'package:myfirstproject/posts/bloc/bloc_export.dart';
import 'package:myfirstproject/posts/models/post.dart';

//定义状态类型 初始化  成功   失败
enum PostStatus{initial,success,failure}

class PostState extends Equatable{
  final PostStatus status;
  final List<Post>posts;
  final bool hasReachedMax;

  PostState({this.status=PostStatus.initial,this.posts=const <Post>[],this.hasReachedMax=false});

  PostState copyWith({PostStatus status,List<Post>posts,bool hasReachedMax}){
    return PostState(
        status: status ?? this.status,
        posts: posts ?? this.posts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [status,posts,hasReachedMax];
}