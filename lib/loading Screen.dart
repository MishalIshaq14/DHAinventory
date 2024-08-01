import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Activity/chooseSector1.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  splashScreen(){
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChooseSectorScreen()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            color: const Color(0xff808836),
            borderRadius: BorderRadius.circular(150)
          ),
          child: Center(
            child: Text("DHA BAHAWALPUR \n      INVENTORY", style: GoogleFonts.jotiOne(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.white

              )

            )),
          ),
        ),
      ),
    );
  }
}
