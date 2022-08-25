import 'package:care4sure/model/listview.dart';
import 'package:care4sure/repo/posts/posts_repo.dart';
import 'package:care4sure/view_model/postviewmodel.dart';
import 'package:flutter/foundation.dart';

class PostsViewModel extends ChangeNotifier {
  PostsRepository? postsRepository;
  PostsViewModel({this.postsRepository});
  Future<List<PostViewModel>> fetchAllPosts() async {
    List<ListViewm> list = await postsRepository!.getAllPosts();
    return list.map((post) => PostViewModel(postModel: post)).toList();
  }
}