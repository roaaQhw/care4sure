import 'package:care4sure/components/components.dart';
import 'package:care4sure/const/const.dart';
import 'package:care4sure/dio/dio_helper.dart';
import 'package:care4sure/model/menuitem.dart';
import 'package:care4sure/view/mainhome/home1.dart';
import 'package:care4sure/view/mainhome/home2.dart';
import 'package:care4sure/view/pharmacy.dart';
import 'package:care4sure/view/signin.dart';
import 'package:care4sure/view/user1.dart';
import 'package:care4sure/view_model/menuitemvm.dart';
import 'package:flutter/material.dart';

import '../notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchcontroller = TextEditingController();

  final searchcontroller1 = TextEditingController();


  var value = "";

  // void signOut (context){
  //   CacheHelper.removeData(
  //     key: 'token',
  //
  //   ).then((value)
  //   {
  //     if(value)
  //     {
  //       navigateAndFinish(
  //         context,
  //         signin(),
  //       );
  //     }
  //   }
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleSpacing: 53.0,
            title: Container(
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            actions: [
              PopupMenuButton<MenuItemm>(
                icon: const Icon(Icons.menu_outlined,
                    size: 31.0, color: Color(0XFF243162)),
                offset: const Offset(50, 50),
                //onSelected: (item) => onSelected(context, item),

                onSelected: (item) {
                  setState(() {
                    if (item.text == "Sign out") {
                      print('\n $token');
                      DioHelper.createOrder().then((value) {
                        print('response is : \n' +
                            value.toString());
                      }).catchError((onError) {
                        print('error is : \n' + onError.toString());
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const signin(),
                          ));
                          }

                          else if (item.text == "Profile")
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const User1(),
                            ));
                      }
                    });
                },
                itemBuilder: (context) =>
                    MenuItems.itemFirst.map(buildItem).toList(),

              ),
              const SizedBox(
                height: 10,
              )
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notification1(),
                    ));
              },
              icon: const Icon(Icons.add_alert_rounded,
                  size: 31.0, color: Color(0XFF243162)),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: getTabBar(context).preferredSize,
              child: Material(
                color: const Color(0xff293462),
                child: getTabBar(context),
              ),
            ),
          ),
          //       body: Container(
          //       width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height,
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: const AssetImage("assets/signin.png"),
          //           fit: BoxFit.fill,
          //           // colorFilter: ColorFilter.mode(
          //           //     Colors.black.withOpacity(0.3), BlendMode.darken)
          //         )),
          // ),
          body: TabBarView(children: [
            //HomeScreen1();
            Home2(),
            const Home1(),
          ])),
    );
  }
}
/*   body:
 */