
import 'package:care4sure/model/listview.dart';
import 'package:care4sure/repo/posts/posts_repo.dart';

class PostsLocal extends PostsRepository {
  @override
  Future<List<ListViewm>> getAllPosts() {
    throw UnimplementedError();
  }

  @override
  Future<ListViewm> getPostById(int id) {
    throw UnimplementedError();
  }


}
