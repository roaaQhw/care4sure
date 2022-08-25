/*
import 'package:care4sure/model/listview.dart';
import 'package:care4sure/repo/posts/posts_repo.dart';

class PostsAPI extends PostsRepository {
  @override
  Future<List<ListViewm>> getAllPosts() async {
    List<ListViewm> posts = [];
    try {
      var response = await Dio().get(POST_LIST);
      var list = response.data as List;
      posts = list.map((post) => PostModel.fromJson(post)).toList();
    } catch (exception) {
      // ignore: avoid_print
      print(exception);
    }
    // ignore: avoid_print
    print(posts);
    return posts;
  }

  @override
  Future<PostModel> getPostById(int id) {
    throw UnimplementedError();
  }
/*
  static Future<Response> creatUser(String name) async {
    final Response response = await post(POST_LIST,
        headers: <String, String>{
          'content_type': 'application/json;charset_UTF-8'
        },
        body: jsonEncode(<String, String>{"name": name}));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("Error");
    }
    return response;
  }

*/
}
*/