import 'dart:ui';

import 'package:care4sure/view/notification.dart';
import 'package:care4sure/view/sidemenu.dart';
import 'package:flutter/material.dart';

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF293462),
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: height * .03),
              child: Image.asset(
                'assets/logo1.png',
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const Notification1(),
                  ));
            },
            icon: const Icon(Icons.notifications),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const NavBar(),
                    ));
              },
              icon: const Icon(Icons.list),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(width * .023),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              const Text(
                'اسم الدواء',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '2000 sp',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('الرف الرابع يسار',
                            style: TextStyle(
                              fontSize: 18.0,

                            ),
                            ),
                            Text('رابع علبة'),
                          ],
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        const Icon(
                          Icons.location_pin,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .021,
              ),
              Row(
                children: const [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'التفاصيل',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                children: const [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'المكونات',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width,
                  child: const Text(
                    'سيتامول ,كافيين',
                    style: TextStyle(
                        fontSize: 16.0, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '20',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: width * .1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'عدد العلب',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '20',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: width * .1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'عدد الحبات',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '2023/10/25',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: width * .1,
                      ),
                      const Text(
                        'تاريخ انتهاء الصلاحية',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '20 \$',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: width * .1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: const Text(
                          'السعر التجاري',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '2000 sp',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: width * .1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'سعر المبيع',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'mool2',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: width * .1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'الشركة المصنعة',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
