// ignore_for_file: prefer_const_constructors

import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:care4sure/components/components.dart';
import 'package:care4sure/view/notification.dart';
import 'package:flutter/material.dart';

class User2 extends StatefulWidget {
  const User2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _User2State createState() => _User2State();
}

class _User2State extends State<User2> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("object $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF8F9F9),
          elevation: 0.0,
          titleSpacing: 60.0,
          title: Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("logo.png"),
                  fit: BoxFit.none,
                )),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios,
                size: 21.0, color: Color(0XFF243162)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notification1(),
                    ));
              },
              icon: const Icon(Icons.add_alert_rounded,
                  size: 41.0, color: Color(0XFF243162)),
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage("s.png"),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          maxRadius: 50.0,
                          backgroundColor: Colors.white,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              iconSize: 100,
                              onPressed: () {
                                pickImage();
                              },
                              icon: Center(
                                child: const Icon(
                                  Icons.add,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "name",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            maxRadius: 11.0,
                            backgroundColor: Color(0xFF00818a),
                            child: icon(Icons.person, 21, Color(0xFFFFFFFF))),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "full name",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: SizedBox(
                        height: 34.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "input name",
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.check,
                                  size: 17,
                                  color: Color(0xFF216583),
                                ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        icon(Icons.location_on, 21, Color(0xFF00818a)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "position",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 34.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "input city",
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.edit,
                                  size: 17,
                                  color: Color(0xFF216583),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "city",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 34.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "input aria",
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.edit,
                                  size: 17,
                                  color: Color(0xFF216583),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "aria",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 34.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "input street",
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.edit,
                                  size: 17,
                                  color: Color(0xFF216583),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "street",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        icon(Icons.email, 21, Color(0xFF00818a)),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: SizedBox(
                        height: 34.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "input email",
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.edit,
                              size: 17,
                              color: Color(0xFF216583),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        icon(Icons.lock, 21, Color(0xFF00818a)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: SizedBox(
                        height: 34.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "input password",
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.edit,
                              size: 17,
                              color: Color(0xFF216583),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
/*
                TextFormField(
                decoration: InputDecoration(
                  labelText: "input Email",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22.0),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.edit,
                    size: 17,
                    color: Color(0xFF216583),
                  ),
                ),
              ) ,
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [

                ],
              ),
              SizedBox(
                height: 10.0,
              ),
                TextFormField(
                decoration: InputDecoration(
                  labelText: "input Password",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22.0),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.edit,
                    size: 17,
                    color: Color(0xFF216583),
                  ),
                ),
              ),

 */