// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:io';
import 'package:care4sure/dio/dio_helper.dart';
import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:care4sure/components/components.dart';
import 'package:care4sure/view/mainhome/home.dart';
import 'package:care4sure/view/notification.dart';
import 'package:flutter/material.dart';


class User1 extends StatefulWidget {
  const User1({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _User1State createState() => _User1State();

}

class _User1State extends State<User1> {

  @override

  final passwordController = TextEditingController();

  File? image1;
  final items1 = ['i1', 'i2', 'i3', 'i4', 'i5'];
  final items2 = ['j1', 'j2', 'j3', 'j4', 'j5'];
  final streetcontroller = TextEditingController();

  String? value;

  String? value1;
  Future pickImage() async {
    try {
      final image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image1 == null) return;
      final imageTemporary = File(image1.path);
      setState(() => this.image1 = imageTemporary);
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
                  image: const AssetImage("assets/logo.png"),
                  fit: BoxFit.none,
                )),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
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
                  size: 31.0, color: Color(0XFF243162)),
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
                          image: const AssetImage("assets/pharmacy-otc-products-turkey-64209774.png"),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Center(
                    child: Column(
                      children: [
                        image1 != null
                            ? Image.file(
                          image1!,
                          width: 40,
                          height: 40,
                        )
                            : InkWell(
                          onTap: () => pickImage(),
                          child: CircleAvatar(
                              maxRadius: 50.0,
                              backgroundColor: Colors.grey[400],
                              child:
                              icon(Icons.add, 21, Color(0xFFFFFFFF))),
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
                          AppLocalizations.of(context)!.fullname,
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
                        icon(Icons.location_on, 21, Color(0xFF00818a)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          AppLocalizations.of(context)!.location,
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
                    Container(
                      height: 34,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.blue[50],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: value,
                          hint:  Text(AppLocalizations.of(context)!.governorate),
                          icon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                          isExpanded: true,
                          //isDense: true,
                          //  itemHeight: 20.0,
                          //    elevation: 0.4,
                          items: items1.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 34,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.blue[50],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: value,
                          hint:  Text(AppLocalizations.of(context)!.city),
                          icon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                          isExpanded: true,
                          //isDense: true,
                          //  itemHeight: 20.0,
                          //    elevation: 0.4,
                          items: items1.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 34,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.blue[50],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: value1,
                          hint:  Text(AppLocalizations.of(context)!.area),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                          isExpanded: true,
                          items: items2.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => value1 = value),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: TextFormField(
                        controller: streetcontroller,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.street,
                          border: const OutlineInputBorder(
                            borderRadius:  BorderRadius.all(
                              Radius.circular(53.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!.empty;
                          }
                          return null;
                        },
                      ),
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
                          AppLocalizations.of(context)!.email,
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
                          AppLocalizations.of(context)!.password,
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
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),


                              prefixIcon:  GestureDetector(child: const Icon(
                                Icons.edit,
                                size: 17,
                                color: Color(0xFF216583),
                              ), onTap: () {


                              },)

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!.empty;
                            } else if (value.length < 8) {
                              return AppLocalizations.of(context)!.pass;
                            } else {
                              return null;
                            }
                          },

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