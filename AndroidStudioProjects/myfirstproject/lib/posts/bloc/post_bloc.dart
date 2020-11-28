
import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/posts/bloc/bloc_export.dart';
import 'package:myfirstproject/posts/bloc/post_event.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/posts/models/post.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  PostBloc({@required this.httpClient}) : super(PostState());

  //消除抖动处理
  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(Stream<PostEvent> events, transitionFn) {
    return super.transformEvents(events.debounceTime(const Duration(milliseconds: 500)), transitionFn);
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    //判断当前是不是获取数据的动作
    if(event is PostFetched){
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<PostState> _mapPostFetchedToState(PostState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts(0, 20);
        return state.copyWith(
            status: PostStatus.success, posts: posts, hasReachedMax: false);
      }
      final posts = await _fetchPosts(state.posts.length, 20);
      return posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(posts)..addAll(posts),
              hasReachedMax: false);
    } on Exception {
      return state.copyWith(status: PostStatus.failure);
    }
  }

  Future<List<Post>>_fetchPosts(int startIndex,int limit) async{
    final response=await httpClient.get("https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit");
    if(response.statusCode==200){
      final data=json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body']
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}