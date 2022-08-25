// ignore_for_file: sized_box_for_whitespace
import 'package:care4sure/view/sidemenu.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';

// ignore: must_be_immutable
class Home3 extends StatefulWidget {


  const Home3({Key? key}) : super(key: key);

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(
        drawer: const NavBar(),
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
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

          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: Container(
                color: Colors.grey[600],
                child: IconButton(
                  iconSize: double.infinity,
                  onPressed: () {

                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 200,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  text(
                      text: "صورة الراشيتا التي تحتوي الدواء",
                      c: Colors.black,
                      fs: 20.0,
                      fw: FontWeight.normal),

                  const SizedBox(height: 70.0),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        defaultButton(
                          function: () {



                          },
                          textt: "تأكيد",
                          isUpperCase: false,
                          width: 100.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}