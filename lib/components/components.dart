import 'package:flutter/cupertino.dart';

class CustomUI {
  box(String text) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff80AF81),
        ),
        color: const Color(0xffB7B597).withOpacity(0.3),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
