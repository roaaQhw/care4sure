// ignore_for_file: override_on_non_overriding_member, unused_field

import 'dart:convert';
import 'dart:ui';

import 'package:care4sure/const/const.dart';
import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:care4sure/view/mainhome/home.dart';
import 'package:care4sure/view/search_page.dart';
import 'package:care4sure/view/signup.dart';
import 'package:care4sure/view_model/signin_veiwmodel.dart';
import 'package:flutter/material.dart';
import 'package:care4sure/components/components.dart';

import '../dio/dio_helper.dart';

// ignore: came_case_types
class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

// ignore: camel_case_types
class _signinState extends State<signin> {
  @override
  String _userName = "", _password = "";
  var svm = signin_viewmodel();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String truepass = "";
  String mas = "";
  FocusNode myFocusNode = new FocusNode();

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
                // colorFilter: ColorFilter.mode(
                //     Colors.black.withOpacity(0.3), BlendMode.darken)
    )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    text(
                      text: AppLocalizations.of(context)!.login1,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                     TextFormField(
                        focusNode: myFocusNode,
                        onSaved: (value) => _userName = value!,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
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
                          // border: const OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(40.0),
                          //   ),
                          // ),
                          errorBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(width: 3, color: Colors.redAccent),
                          ),
                          prefixIcon: const Icon(
                            Icons.email,
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
                      height: 25.0,
                    ),

                     TextFormField(
                        onSaved: (value) => _password = value!,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.password,
                            border: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              ),
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
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                            suffixIcon: const Icon(
                              Icons.remove_red_eye,
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email musn't be password";
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
                        color: const Color(0xFF00818A),
                      ),
                      width: double.infinity,
                      height: 53.0,
                      child: MaterialButton(
                        child: text(
                            text: AppLocalizations.of(context)!.login2,
                            fs: 16.0,
                            c: Colors.white),
                        onPressed: () {
                          if (mas == "Passowrd error , Please try again") {
                            truepass = "mas";
                          } else {
                            if (formKey.currentState!.validate()) {
                              DioHelper.login(data: {
                                "email": emailController.text,
                                "password": passwordController.text,
                              }).then((value) {
                                print('response is : \n' +
                                    value.data['user']['roles'][0]['name']);
                                var result =
                                    value.data['user']['roles'][0]['name'];
                                print(value.data['access_token']);
                                token = value.data['access_token'];
                                if (result == "Pharmacy") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchPage(),
                                      ));
                                } else if (result == "User" ) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ));
                                }
                              }).catchError((onError) {
                                print('error is : \n' + onError.toString());
                              });
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const signup(),
                            ));
                      },
                      child: text(
                          text: AppLocalizations.of(context)!.registernow,
                          fs: 18.0),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
