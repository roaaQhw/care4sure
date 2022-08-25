import 'package:care4sure/model/listview.dart';
import 'package:care4sure/repo/posts/posts_repo.dart';
import 'package:flutter/cupertino.dart';

class PostsFake extends PostsRepository {
  static ListViewm ll=ListViewm(image: const Image(
    image: AssetImage("images/sedra.jpg"),
  ),pharmacyName: "ssderda",pharmacyWebsite: "alkateb");

  @override
  Future<List<ListViewm>> getAllPosts() async {
    List<ListViewm>  posts =[ll,ll,ll];
    return posts;
  }

  @override
  Future<ListViewm> getPostById(int id) {
    throw UnimplementedError();
  }
}
