// ignore_for_file: prefer_const_constructors

import 'package:care4sure/components/components.dart';
import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:care4sure/view/all.dart';
import 'package:care4sure/view/pharmacy1.dart';
import 'package:care4sure/view/pharmacy2.dart';
import 'package:care4sure/view/signin.dart';
import 'package:care4sure/view/user1.dart';
import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image:const AssetImage("assets/images/sidemenu1.png"),
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image:const AssetImage("assets/images/sidemenu2.png"),
                  fit: BoxFit.fill,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CircleAvatar(
                          maxRadius: 70.0,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/pharmacy-otc-products-turkey-64209774.jpg',
                              fit: BoxFit.cover,
                              width: 500.0,
                              height: 500.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Sedra",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ListTile(
                        onLongPress: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const Pharmacy2(),
                              ));
                        },
                        leading: const Icon(Icons.person,size: 36,),
                        title:    Text(
                          AppLocalizations.of(context)!.profile,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        // ignore: avoid_returning_null_for_void
                        onTap: () => null,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ListTile(
                        onLongPress: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const AllMed(),
                              ));
                        },
                        leading: const Icon(Icons.medical_services,size: 36),
                        title:  Text(

                          AppLocalizations.of(context)!.drug,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        // ignore: avoid_returning_null_for_void
                        onTap: () => null,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ListTile(
                        onLongPress: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const signin(),
                              ));
                        },
                        leading: const Icon(Icons.logout_outlined,size: 36),
                        title:   Text(
                          AppLocalizations.of(context)!.signout,                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        ),
                        // ignore: avoid_returning_null_for_void
                        onTap: () => null,

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}