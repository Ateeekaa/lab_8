import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/post.dart';
import '../repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _repository = PostRepository(); 

 PostBloc() : super(PostInitial()) {
  on<GetPostEvent>((event, emit) => _repository.getPosts(event, emit));
}
}
