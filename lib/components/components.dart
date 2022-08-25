

import 'dart:ui';

import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:care4sure/model/listview.dart';
import 'package:care4sure/model/menuitem.dart';
import 'package:care4sure/view/add.dart';
import 'package:care4sure/view/pharmacy.dart';
import 'package:care4sure/view/rush.dart';
import 'package:care4sure/view_model/menuitemvm.dart';
import 'package:flutter/material.dart';
import 'package:care4sure/view/pharmacy2.dart';
import 'package:fluttertoast/fluttertoast.dart';



import '../view/user1.dart';


List<ListViewm> listt = [];

void onSelected(BuildContext context, MenuItemm item) {
  switch (item) {
    case MenuItems.itemlogout:
      break;
    case MenuItems.itemprofile:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const User1(),
          ));
      break;
  }
}

PopupMenuItem<MenuItemm> buildItem(MenuItemm item) => PopupMenuItem<MenuItemm>(
  value: item,
  child: Row(
    children: [
      Text(item.text),
      const SizedBox(width: 8,),
      Icon(
        item.icon,
        color: Colors.black,
        size: 20,
      ),
      const SizedBox(width: 12)
    ],
  ),
);
DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  value: item,
  child: Text(
    item,
    style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.grey[900]),
  ),
);

Widget viewlist(int itemCount, String text1, BuildContext context,
    TextEditingController searchcontroller) {
  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 33.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: Colors.white,
              ),
              child: TextFormField(
                controller: searchcontroller,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)?.search_for_medicine,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          text(text: text1, c: Colors.black, fs: 18.0),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 3.0,
                  color: const Color(0xFFb5b4b4),
                ),
                itemCount: listt.length,
                itemBuilder: (context, index) => listpharm(
                    context,
                    listt[index].pharmacyName!,
                    listt[index].pharmacyWebsite!,
                    listt[index].image!),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RushSceen(),
                ));
          },
          icon: const Icon(
            Icons.add_circle_sharp,
            color: Color(0XFF026C73),
            size: 61.0,
          ),
        ),
      ),
    ],
  );
}

TabBar getTabBar(BuildContext context) => TabBar(
  tabs: [
    Tab(
      text: AppLocalizations.of(context)!.medicine_show,
      icon: const Icon(Icons.medication, size: 21.0, color: Colors.white),
    ),
    Tab(
      text: AppLocalizations.of(context)!.medicine_reservation,
      icon:
      const Icon(Icons.calendar_today, size: 17.0, color: Colors.white),
    ),
  ],
);

Widget defaultButton({
  double width = double.infinity,
  Color background =const Color(0XFF293462),
  required Function function,
  required String textt,
  bool isUpperCase = true,
  double radios = 26.0,
  double height = 35.0,
}) =>
    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radios),
          color: background,
        ),
        width: width,
        height: height,
        child: MaterialButton(
            child:
            text(text: isUpperCase ? textt.toUpperCase() : textt, fs: 20.0),
            onPressed: () => function));
/*
const Image(
                  image: AssetImage("images/sedra.jpg"),
                )
*/
Widget listmedicin(String name,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon(
                  Icons.medication_liquid_rounded, 31, const Color(0XFF00AFB9)),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),

                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: ()  {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => const Add(),
                ));
                },
                icon: icon(Icons.edit, 21, const Color(0XFF00AFB9)),
              ),
              const SizedBox(
                width: 8.0,
              ),
              IconButton(
                onPressed: ()  {

                  Fluttertoast.showToast(
                      msg: "The medicine is deleted",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);

                },
                icon: icon(Icons.restore_from_trash_outlined, 21,
                    const Color(0XFF00AFB9)),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget listnotification(String messag) {
  return Container(
    color: Colors.white,
    //height: 20.0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          const CircleAvatar(
            maxRadius: 10.0,
            backgroundColor: Color(0xff026c73),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Text(
              messag,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16.0,overflow: TextOverflow.clip),
            ),
          ),

        ],
      ),
    ),
  );
}

Widget listpharm(BuildContext context,String pos, String name, Image image) {
  return InkWell(
    onTap: ((){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Pharmacy(),
          ));
    }),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                  width: 85.0,
                  height: 85.0,
                  child: image),
              const SizedBox(width: 15.0),
              Column(
                children: [
                  Row(
                    children: [
                      icon(Icons.home, 15, const Color(0XFF00AFB9)),
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        pos,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    ),
  );
}

Widget listpharm2(BuildContext context,String pos, String name, Image image) {
  return InkWell(
    onTap: ((){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Pharmacy2(),
          ));
    }),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                  width: 85.0,
                  height: 85.0,
                  child: image),
              const SizedBox(width: 15.0),
              Column(
                children: [
                  Row(
                    children: [
                      icon(Icons.home, 15, const Color(0XFF00AFB9)),
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        pos,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    ),
  );
}

Widget choselist(String str, Icon ic, Function f, double fs) {
  return GestureDetector(
    onTap: () => f,
    // ignore: avoid_unnecessary_containers
    child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ic,
          const SizedBox(
            width: 10.0,
          ),
          Text(
            str,
            style: TextStyle(
                fontSize: fs, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

Widget text(
    {required String text,
      Color c = Colors.white,
      double fs = 30.0,
      FontWeight fw = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
      color: c,
      fontSize: fs,
      fontWeight: fw,
    ),
  );
}

// ignore: non_constant_identifier_names
Widget icon(IconData ic, double s, Color C) {
  return Icon(ic, color: C, size: s);
}