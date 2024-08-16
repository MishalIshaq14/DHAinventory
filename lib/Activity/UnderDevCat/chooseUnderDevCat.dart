import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UnderDevResedential.dart';

class ChooseUnderDevCategory extends StatefulWidget {
  const ChooseUnderDevCategory({super.key});

  @override
  State<ChooseUnderDevCategory> createState() => _ChooseUnderDevCategoryState();
}

class _ChooseUnderDevCategoryState extends State<ChooseUnderDevCategory> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    " UNDER DEVELOP SECTORS",
                    style: GoogleFonts.montaguSlab(
                        textStyle: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 60),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Choose Category",style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UnderDevResedential()));
                          },
                          child: const Center(
                            child: Text(
                              "Residential Plots",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
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
                              "Commercial Plots",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
