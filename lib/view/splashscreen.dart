import 'package:care4sure/view/signin.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> signin()),);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          color: const Color(0xFF293462),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo1.png"),
                      fit: BoxFit.contain,


                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}