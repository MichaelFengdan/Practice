import 'package:equatable/equatable.dart';
import 'package:myfirstproject/posts/bloc/post_state.dart';

abstract class PostEvent extends Equatable{

  @override
  List<Object> get props => [];
}
class PostFetched extends PostEvent{

}