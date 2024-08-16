import 'package:flutter/material.dart';


class BackBtn extends StatelessWidget {
  String text;
  VoidCallback ontap;
  BackBtn({super.key,required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: const Color(0xff80AF81),
          borderRadius:BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.keyboard_backspace_outlined, color: Colors.white, size: 18,),
              Text(text,style: const  TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ],
          ),
        ),
      ),
    );
  }
}





