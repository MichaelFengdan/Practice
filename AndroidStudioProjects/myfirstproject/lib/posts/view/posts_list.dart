import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:myfirstproject/posts/bloc/bloc_export.dart';
import 'package:myfirstproject/posts/widgets/bottom_loader.dart';
import 'package:myfirstproject/posts/widgets/post_list_item.dart';

//数据列表View层
class PostLists extends StatefulWidget {
  @override
  _PostListsState createState() => _PostListsState();
}

class _PostListsState extends State<PostLists> {
  final _scrollController=ScrollController();
  PostBloc _postBloc;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _postBloc =BlocProvider.of<PostBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc,PostState>(
      listener: (context,state){
        if(!state.hasReachedMax&&_isBottom){
            _postBloc.add(PostFetched());
        }
      },
      builder: (context,state){
        switch(state.status){
          case PostStatus.failure:
            return const Center(child: Text("failed to fetch posts"),);
          case PostStatus.success:
            if(state.posts.isEmpty){
              return const Center(child: Text("no posts"));
            }
            //数据正常，准备构建列表数据
            return ListView.builder(
                itemBuilder: (context, index) {
                  return index >= state.posts.length
                      ? BottomLoader()
                      : PostListItem(post: state.posts[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
                controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  void _onScroll(){
    if(_isBottom){//刷新数据
      _postBloc.add(PostFetched());
    }
  }
  bool get _isBottom{
    if(_scrollController.hasClients) return false;
    final maxScroll=_scrollController.position.maxScrollExtent;
    final currentScroll=_scrollController.offset;
    return currentScroll>=(maxScroll*0.9);
  }
  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }
}
