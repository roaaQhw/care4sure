// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:care4sure/components/components.dart';
import 'package:care4sure/const/const.dart';
import 'package:care4sure/dio/dio_helper.dart';
import 'package:care4sure/view/add.dart';
import 'package:care4sure/view/all.dart';
import 'package:care4sure/view/notification.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../dio/end_pionts.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {

  final items1 = ['i1', 'i2', 'i3', 'i4', 'i5'];

  String? value;
  final name_ar = TextEditingController();
  final name_en = TextEditingController();
  final position = TextEditingController();
  final materials = TextEditingController();
  final quantity = TextEditingController();
  final pills = TextEditingController();
  final expiration = TextEditingController();
  final c_price = TextEditingController();
  final price = TextEditingController();
  final companyName = TextEditingController();

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
            onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllMed(),
                ));},
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    Text(
                      "ادخال دواء جديد",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                      ),
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
                              controller: name_ar,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "اسم الدواء "
                              "باللغة العربية ",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
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
                              controller: name_en,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "اسم الدواء "
                              "باللغة الاجنبية ",
                          style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
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
                              controller: position,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "الموقع بالصيدلية "
                             ,
                          style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
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
                              controller: materials,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          " التركيبات "
                              ,
                          style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
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
                              controller: quantity,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "عدد العلب "
                              ,
                          style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
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

                              controller: pills,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "عدد الحبات "
                          ,
                          style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),




                      ],

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 34.0,

                            child: TextFormField(
                              controller: expiration,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          " تاريخ انتهاء الصلاحية "
                              ,
                          style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
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
                              controller: c_price,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "السعر التجاري "
                             ,
                          style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
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
                              controller: price,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "سعر المبيع",
                          style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
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
                              controller: companyName,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "الشركة المصنعة",
                          style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),




                      ],
                    ),

                    const SizedBox(
                      height: 30.0,
                    ),
                    defaultButton(
                      function: (){
                        DioHelper.dio.post(ADD,data: {
                          "shelf_names": [position],
                          "company_name": companyName.text,
                          "material_ids[0]" :materials.text,
                          'quantity' : quantity.text,
                          'pills' : pills.text,
                          'expiration_date' : expiration.text,
                          'c_price' : c_price.text,
                          'price' : price.text,
                          'name_en' : name_en.text,
                          'name_ar' : name_ar.text
                        },
                            options: Options(
                              headers: {
                                'Authorization' : 'Bearer $token'
                              },
                            )
                        ).then((value) {
                          print('response is :' +value.toString());
                        }).catchError((onError) {
                          print('error is : \n' + onError.toString());
                        });
                      },
                      textt: "تأكيد",
                      isUpperCase: false,
                      width: 181.0,
                      height: 31,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}