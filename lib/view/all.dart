import 'package:care4sure/components/components.dart';
import 'package:care4sure/dio/dio_helper.dart';
import 'package:care4sure/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:care4sure/view/add.dart';
import 'package:care4sure/view/medicine_details.dart';
import 'package:care4sure/view/notification.dart';
import 'package:care4sure/view/rush.dart';
import 'package:care4sure/view/sidemenu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AllMed extends StatefulWidget {
  const AllMed({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AllMedState createState() => _AllMedState();
}

class _AllMedState extends State<AllMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F9F9),
        elevation: 0.0,
        titleSpacing: 53.0,
        title:   Container(
          height: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.none,
              )),
        ),
        leading:
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavBar(),
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
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,

        children: [
          Padding(
            padding: const EdgeInsets.all( 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 5.0,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 30.0,),

                Text(
                  AppLocalizations.of(context)!.medicines,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30.0,),

                FutureBuilder(
                  future: DioHelper.getAllMedicine(),
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      Response<dynamic> response = snapshot.data;
                      List<dynamic> data = response.data['data'];
                      print(data[0].toString());
                      return InkWell(
                        onTap: ((){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MedicineDetails(),
                              ));
                        }),
                        child: Expanded(
                          child: ListView.separated(

                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            separatorBuilder: (context, index) =>
                                Container(
                                  width: double.infinity,
                                  height: 3.0,
                                  color: const Color(0xFFb5b4b4),
                                ),
                            itemCount: data.length,
                            itemBuilder: (context, index) => Padding(
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
                                              data[index]['name_ar'],
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

                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        IconButton(
                                          onPressed: ()  {
                                            setState(() {
                                              DioHelper.deleteMed().then((value) {
                                                print('response is : \n' +
                                                    value.toString());
                                              }).catchError((onError) {
                                                print('error is : \n' + onError.toString());
                                              });
                                              data.removeAt(index);


                                              Fluttertoast.showToast(
                                                  msg: "The medicine is deleted",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);

                                            });

                                          },
                                          icon: icon(Icons.restore_from_trash_outlined, 21,
                                              const Color(0XFF00AFB9)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                          child: Text('Internet connection error'));
                    }
                    return CircularProgressIndicator();
                  },
                )
                // SingleChildScrollView(
                //   child: ListView.separated(
                //     shrinkWrap: true,
                //     separatorBuilder: (context, index) => Container(
                //       width: double.infinity,
                //       height: 2.0,
                //       color: const Color(0xFF707070),
                //     ),
                //     itemCount: 6,
                //     itemBuilder: (context, index) => listmedicin("sedra", "position",context),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                iconSize: 61,
                alignment: Alignment.center,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Add(),
                      ));
                },
                icon: const Icon(
                  Icons.add_circle,
                  size: 61,
                  color: Color(0xFF026c73),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}