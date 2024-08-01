import 'package:dha/components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevelopResidential extends StatefulWidget {
  const DevelopResidential({super.key});

  @override
  State<DevelopResidential> createState() => _DevelopResidentialState();
}

class _DevelopResidentialState extends State<DevelopResidential> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff808836),
          title: Text(
            "DEVELOP SECTORS",
            style: GoogleFonts.jotiOne(
                textStyle: const TextStyle(fontSize: 28, color: Colors.white)),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Flexible(
                  child: Column(
                children: [
                  Center(
                    child: Text(
                      "Residential Plots",
                      style: GoogleFonts.montaguSlab(
                          textStyle: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("A",style: 
                    TextStyle(
                      color: Color(0xff820D0D),
                      fontSize: 18
                    ),),
                  const SizedBox(
                    height: 5,
                  ),






                ],
              )),
            ),
          ],
        ));
  }
}
