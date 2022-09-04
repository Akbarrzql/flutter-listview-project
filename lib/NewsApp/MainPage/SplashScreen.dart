import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_project/NewsApp/MainPage/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeNews()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Besito Times", style: GoogleFonts.unifrakturMaguntia(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),),
                SizedBox(height: 5,),
                Text("The Public Press is a Public Trust", style: GoogleFonts.playfairDisplay(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
