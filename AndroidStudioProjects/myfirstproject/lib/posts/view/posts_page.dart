
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstproject/posts/bloc/bloc_export.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/posts/view/posts_list.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts'),),
      body: BlocProvider(
        create: (_)=> PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: PostLists(),
      ),
    );
  }
}
