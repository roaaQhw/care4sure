import 'dart:ui';

import 'package:care4sure/dio/dio_helper.dart';
import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:care4sure/view/mainhome/home.dart';
import 'package:flutter/material.dart';
import 'package:care4sure/components/components.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final locationcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final streetcontroller = TextEditingController();
  final allGovernment = [
    'دمشق',
    'حلب',
    'حمص',
    'دير الزور',
    'الرقة',
    'درعا',
    'حماه',
    'أدلب',
    'الحسكة',
    'طرطوس',
    'السويداء'
  ];
  final cities1 = [
    'دمشق القديمة',
    'ساروجة',
    'القنوات',
    'جوبر',
    'الميدان',
    'الشاغور',
    'المزة'
  ];
  final area1 = ['باب توما', 'القيمرية', 'الحميدية', 'الحريقة'];
  var formKey = GlobalKey<FormState>();

  String? government;

  String? city;

  String? area;

  var key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage("assets/Mask Group 2.png"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      text(
                        text: AppLocalizations.of(context)!.signup,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.username1,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            //<-- SEE HERE
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold, //<-- SEE HERE
                          ),
                          errorBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(width: 3, color: Colors.redAccent),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username musn't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.email,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            //<-- SEE HERE
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold, //<-- SEE HERE
                          ),
                          errorBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(width: 3, color: Colors.redAccent),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email musn't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.password,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            //<-- SEE HERE
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold, //<-- SEE HERE
                          ),
                          errorBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(width: 3, color: Colors.redAccent),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter New Password";
                          } else if (value.length < 8) {
                            return "Password must be atleast 8 characters long";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 53,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: government,
                            hint: const Text("Government"),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),

                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.grey),
                            isExpanded: true,
                            //isDense: true,
                            //  itemHeight: 20.0,
                            //    elevation: 0.4,
                            items: allGovernment.map(buildMenuItem).toList(),
                            onChanged: (value) =>
                                setState(() => this.government = value),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 53,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: city,
                            hint: const Text("City"),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.grey),
                            isExpanded: true,
                            //isDense: true,
                            //  itemHeight: 20.0,
                            //    elevation: 0.4,
                            items: cities1.map(buildMenuItem).toList(),
                            onChanged: (value) =>
                                setState(() => this.city = value),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 53,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: area,
                            hint: const Text("Area"),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                            isExpanded: true,
                            items: area1.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() => area = value),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: streetcontroller,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.street,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.white),
                            //<-- SEE HERE
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold, //<-- SEE HERE
                          ),
                          errorBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(width: 3, color: Colors.redAccent),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Street musn't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: const Color(0xFF00818a),
                        ),
                        width: double.infinity,
                        height: 53.0,
                        child: MaterialButton(
                          child: text(
                            text: AppLocalizations.of(context)!.signup,
                            fs: 16,
                          ),
                          onPressed: () {
                            if (government == null) {
                              Fluttertoast.showToast(
                                  msg: "The Government is empty",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (city == null) {
                              Fluttertoast.showToast(
                                  msg: "The city is empty",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (area == null) {
                              Fluttertoast.showToast(
                                  msg: "The area is empty",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (formKey.currentState!.validate()) {
                              print("""
                               "username": ${usernamecontroller.text},
                               "email": ${emailController.text},
                               "password": ${passwordController.text},
                               "street": ${streetcontroller.text},
                              """);
                              DioHelper.signup(data: {
                                "username": usernamecontroller.text,
                                "email": emailController.text,
                                "password": passwordController.text,
                                "street": streetcontroller.text,
                                if (government == "دمشق")
                                  "state_id": "1",

                                if (city == "دمشق القديمة")
                                  "city_id": "1"
                                else if (city == "ساروجة")
                                  "city_id": "2"
                                else if (city == "القنوات")
                                  "city_id": "3"
                                else if (city == "جوبر")
                                  "city_id": "4"
                                else if (city == "الميدان")
                                  "city_id": "5"
                                else if (city == "الشاغور")
                                  "city_id": "6"
                                else
                                  "city_id": "7",


                                if(area == "باب توما")
                                  "area_id" : "1"
                               else if(area == "القيمرية")
                                  "area_id" : "2"
                                else if(area == "الحميدية")
                                    "area_id" : "3"
                                  else
                                      "area_id" : "4",
                              }


                              ).then((value) {
                                print('response is : \n' + value.toString());
                              }).catchError((onError) {
                                print('error is : \n' + onError.toString());
                              });
                              // print (government);
                              // print(city);
                              // print(area);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
                            }

                            //  print(userViewModel.userModel!.username);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
