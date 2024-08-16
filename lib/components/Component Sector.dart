import 'package:flutter/material.dart';

class Sector extends StatelessWidget {
  String text;
  VoidCallback ontap;
   Sector({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 30,
        width: 70,
        decoration: BoxDecoration(
          color: const Color(0xff80AF81),
          borderRadius:BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(text,style: const  TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),),
        ),
      ),
    );
  }
}
