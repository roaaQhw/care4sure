
import 'package:care4sure/model/listview.dart';

class PostViewModel {
  ListViewm? postModel;
  PostViewModel({this.postModel});

  get pharmacyName => postModel?.pharmacyName;
  get pharmacyWebsite => postModel?.pharmacyWebsite;
  get image => postModel?.image;
}
