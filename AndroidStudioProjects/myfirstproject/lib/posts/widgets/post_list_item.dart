import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myfirstproject/posts/models/models_export.dart';
class PostListItem extends StatelessWidget {
  Post post;
  PostListItem({Key key,@required Post post}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${post.id}',style: textTheme.caption,),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}
