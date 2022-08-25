// ignore_for_file: prefer_const_constructors



import 'package:care4sure/components/components.dart';
import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:care4sure/view/notification.dart';
import 'package:flutter/material.dart';


class Pharmacy extends StatefulWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  final items2 = ['i1', 'i2', 'i3', 'i4', 'i5'];
  String? value1;
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
              Navigator.pop(context);
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
                          image: const AssetImage("assets/images/s.png"),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Center(
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        CircleAvatar(
                          maxRadius: 50.0,
                          backgroundImage: AssetImage("assets/pharmacy-otc-products-turkey-64209774.jpg"),
                          backgroundColor: Color(0xFF00818a),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "name pharmacy",
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
                padding: const EdgeInsets.only(
                    right: 50.0, left: 20, top: 80.0, bottom: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              icon(Icons.location_on, 21, Color(0xFF00818a)),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "position",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "دمشق , دمشق القديمة , باب توما",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        icon(Icons.work, 21, Color(0xFF00818a)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Working hours",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [

                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Day",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "7 ايام",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Row(
                              children: const [
                                Text(
                                  'From',
                                  style: TextStyle(
                                      fontSize: 18.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 40.0,
                                ),
                                Expanded(
                                  child: Text(
                                    "الاثنين",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,

                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                            child: Row(
                              children: const [
                                Text(
                                  'To',
                                  style: TextStyle(
                                      fontSize: 18.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 40.0,
                                ),
                                Expanded(
                                  child: Text(
                                    'السبت',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              icon(Icons.call, 21, Color(0xFF00818a)),
                              SizedBox(
                                width: 5.0,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*.32,
                                height: MediaQuery.of(context).size.height*.0357,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Contact Information",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
                            itemBuilder: (context, index) => Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "0965469372",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),


                              ),
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Row(
                    //   children: [
                    //     icon(Icons.book_outlined, 21, Color(0xFF00818a)),
                    //     SizedBox(
                    //       width: 5.0,
                    //     ),
                    //     Text(
                    //       "Booking period",
                    //       style: TextStyle(
                    //           fontSize: 18.0, fontWeight: FontWeight.bold),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 30.0,
                    // ),
                    // Container(
                    //   height: 34,
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 12, vertical: 4),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(25.0),
                    //     color: Colors.blue[50],
                    //   ),
                    //   child: DropdownButtonHideUnderline(
                    //     child: DropdownButton<String>(
                    //       value: value1,
                    //       hint: Text('time'),
                    //       icon: const Icon(
                    //         Icons.arrow_drop_down,
                    //         color: Colors.grey,
                    //       ),
                    //       isExpanded: true,
                    //       items: items2.map(buildMenuItem).toList(),
                    //       onChanged: (value) => setState(() => value1 = value),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 30.0,
                    // ),
                    // defaultButton(
                    //     function: () {},
                    //     textt: AppLocalizations.of(context)!.confirmation,
                    //     isUpperCase: false,
                    //     width: 180.0,
                    //     radios: 22),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}