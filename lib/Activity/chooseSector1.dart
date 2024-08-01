import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ChooseCategory2.dart';

class ChooseSectorScreen extends StatefulWidget {
  const ChooseSectorScreen({super.key});

  @override
  State<ChooseSectorScreen> createState() => _ChooseSectorScreenState();
}

class _ChooseSectorScreenState extends State<ChooseSectorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff808836),
          title: Text(
            "DHA BAHAWALPUR",
            style: GoogleFonts.jotiOne(
                textStyle: const TextStyle(fontSize: 28, color: Colors.white)),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Flexible(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "             SEC WISE \n TOTAL INVENTORY",
                    style: GoogleFonts.montaguSlab(
                        textStyle: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text("Choose Any",style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),
          const SizedBox(
            height: 30,
          ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 20.0),
                            backgroundColor: const Color(0xff80AF81),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChooseDevelopScreen()));
                          },
                          child: const Center(
                            child: Text(
                              "Develop Sectors",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 20.0),
                            backgroundColor: const Color(0xff80AF81),
                          ),
                          onPressed: () {},
                          child: const Center(
                            child: Text(
                              "Under Develop Sectors",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 20.0),
                            backgroundColor: const Color(0xff80AF81),
                          ),
                          onPressed: () {},
                          child: const Center(
                            child: Text(
                              "Non Develop Sectors",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
