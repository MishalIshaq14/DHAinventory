import 'package:dha/Activity/chooseSector1.dart';
import 'package:flutter/material.dart';

import 'Activity/DevelopResidential3.dart';
import 'loading Screen.dart';

void main() {
  runApp(const DHA());
}

class DHA extends StatefulWidget {
  const DHA({super.key});

  @override
  State<DHA> createState() => _DHAState();
}

class _DHAState extends State<DHA> {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DHA Inventory",
      home: DevelopResidential(),
    );
  }
}


