import 'package:care4sure/components/components.dart';
import 'package:care4sure/model/menuitem.dart';
import 'package:care4sure/view_model/menuitemvm.dart';
import 'package:flutter/material.dart';



class Notification1 extends StatefulWidget {
  const Notification1({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Notification1State createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
    var i=0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        titleSpacing: 53.0,
        title:   Container(
          height: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("logo.png"),
                fit: BoxFit.none,
              )),
        ),
        actions: [
          PopupMenuButton<MenuItemm>(
            icon: const Icon(Icons.menu_outlined,
                size: 31.0, color: Color(0XFF243162)),
            offset: const Offset(50, 50),
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) =>
                MenuItems.itemFirst.map(buildItem).toList(),
          ),
          const SizedBox(
            height: 10,
          )
        ],
        leading: IconButton(
          onPressed: () {
            if (i == 0) {
              Navigator.pop(
                  context);
            }
          },
          icon: const Icon(Icons.arrow_back_ios,
              size: 31.0, color: Color(0XFF243162)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[300],
            height: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      listnotification("sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssk"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}