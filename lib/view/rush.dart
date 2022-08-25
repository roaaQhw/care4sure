// ignore_for_file: sized_box_for_whitespace
import 'dart:io';
import 'dart:ui';

import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:care4sure/view/notification.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../components/components.dart';
import 'package:care4sure/model/menuitem.dart';
import 'package:care4sure/view_model/menuitemvm.dart';

// ignore: must_be_immutable
class RushSceen extends StatefulWidget {
  const RushSceen({Key? key}) : super(key: key);

  @override
  State<RushSceen> createState() => _RushSceenState();
}

class _RushSceenState extends State<RushSceen> {
  XFile? image;
  final ImagePicker _picker = ImagePicker();

  Future pickImage() async {
    try {
      final XFile? selectImage =
          await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        image = selectImage;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("object $e");
    }
  }

  sendImage(XFile? image) async {
    Dio dio = new Dio();
    String fileName = image!.path.split('/').last;
    FormData formData = new FormData.fromMap({
      "imagePath":
          await MultipartFile.fromFile(image!.path, filename: fileName),
    });
    var response = await dio
        .post("http://care4sure.herokuapp.com/api/prescriptions",
            data: formData,
            options: Options(headers: {
              "Accept": "application/json",
              "Connection": 'keep-alive',
              'Content-Type': 'multipart/form-data;',
              'Authorization':
                  'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vY2FyZTRzdXJlLmhlcm9rdWFwcC5jb20vYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2NjA1OTU1MDYsImV4cCI6MTY2MDU5OTEwNiwibmJmIjoxNjYwNTk1NTA2LCJqdGkiOiIyZUkxeHg1cDg0UHZsTkxpIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.2TuyCLSJyqD6-9B3HZ6FktwjZaR6acy5zQ58iw8BsZk'
            }))
        .then((newResponse) {
      print(newResponse.data);
    });
  }

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
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0XFF243162),
              ),
            ),
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
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) =>
                    MenuItems.itemFirst.map(buildItem).toList(),
              ),
              const SizedBox(
                height: 10,
              )
            ],
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              // Expanded(
              //   child: Container(
              //     width: double.infinity,
              //     color: Colors.grey[600],
              //     child: IconButton(
              //
              //       iconSize: 100,
              //
              //       onPressed: () {
              //         pickImage();
              //       },
              //
              //       icon: const Icon(
              //         Icons.add,
              //         color: Colors.white,
              //         size: 200,
              //       ),
              //     ),
              //   ),
              //
              // ),
              image == null
                  ? Container(
                      width: double.infinity,
                      height: 300.0,
                      color: Colors.grey[600],
                      child: IconButton(
                        iconSize: 100,
                        onPressed: () {
                          pickImage();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 200,
                        ),
                      ),
                    )
                  : Image.file(File(image!.path),
                      width: double.infinity, height: 300.0, fit: BoxFit.cover),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: text(
                          text: AppLocalizations.of(context)!.prescription,
                          c: Colors.black,
                          fs: 20.0,
                          fw: FontWeight.normal),
                    ),
                    const SizedBox(height: 70.0),
                    Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          sendImage(image);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff026C73), Color(0xff01363A)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "تأكيد",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
