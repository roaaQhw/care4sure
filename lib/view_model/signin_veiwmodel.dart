import 'package:care4sure/model/user.dart';


// ignore: camel_case_types
class signin_viewmodel {
  //PostsRepository? postsRepository;
  //signin_viewmodel({this.postsRepository});
  UserModel? usermodel;
  signin_viewmodel({this.usermodel});
  get email {
    return usermodel?.email;
  }
  get location => usermodel?.location;
  get password => usermodel?.password;
  get username => usermodel?.username;

}