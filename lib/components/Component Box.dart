import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  String text;
  VoidCallback ontap;

  Box({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff80AF81),
          ),
          borderRadius:BorderRadius.circular(15),
          color: const Color(0xffB7B597).withOpacity(0.3),
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
