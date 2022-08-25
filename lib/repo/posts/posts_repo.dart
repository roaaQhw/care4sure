
import 'package:care4sure/model/listview.dart';

abstract class PostsRepository {
  Future<List<ListViewm>> getAllPosts();
  Future<ListViewm> getPostById(int id);
}
