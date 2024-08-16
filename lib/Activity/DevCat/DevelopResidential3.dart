import 'package:dha/components/Component%20Sector.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/Component Back.dart';
import '../../components/Component Box.dart';
import '../rough.dart';
import 'ChooseCategory2.dart';
import 'DevA2KDataStore.dart';

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
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [Sector(text: "A", ontap: () {})],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Box(
                          text: "2 Kanal",
                          ontap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DevA2KDataStore()));
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      Box(text: "1 Kanal", ontap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [Sector(text: "B", ontap: () {})],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Box(text: "2 Kanal", ontap: () {}),
                      const SizedBox(
                        width: 5,
                      ),
                      Box(text: "1 Kanal", ontap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [Sector(text: "C", ontap: () {})],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Box(text: "10 Marla", ontap: () {}),
                      const SizedBox(
                        width: 5,
                      ),
                      Box(text: "8 Marla", ontap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BackBtn(
                          text: "Back",
                          ontap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChooseDevelopScreen()));
                          })
                    ],
                  )
                ],
              )),
            ),
          ],
        ));
  }
}
