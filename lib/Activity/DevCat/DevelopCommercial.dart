import 'package:dha/components/Component%20Back.dart';
import 'package:dha/components/Component%20Box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/Component Sector.dart';

class DevelopCommercial extends StatefulWidget {
  const DevelopCommercial({super.key});

  @override
  State<DevelopCommercial> createState() => _DevelopCommercialState();
}

class _DevelopCommercialState extends State<DevelopCommercial> {
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
                        "Commercial Plots",
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
                      children: [
                        Sector(text: "A", ontap: (){})
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                       Box(text: "LC", ontap: (){
                       }),
                        const SizedBox(
                          width: 5,
                        ),
                        Box(text: "8 MC", ontap: (){}),
                        const SizedBox(
                          width: 5,
                        ),
                        Box(text: "4 MC", ontap: (){}),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Box(text: "2 Kanal", ontap: (){

                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Sector(text: "B", ontap: (){})
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Box(text: "LC", ontap: (){}),
                        const SizedBox(
                          width: 5,
                        ),
                        Box(text: "8 MC", ontap: (){}),
                        const SizedBox(
                          width: 5,
                        ),
                        Box(text: "4 MC", ontap: (){}),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Box(text: "2 MC", ontap: (){}),
                      ],
                    ),





                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Sector(text: "C", ontap: (){})
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Box(text: "LC", ontap: (){}),
                        const SizedBox(
                          width: 5,
                        ),
                        Box(text: "4 MC", ontap: (){}),
                        const SizedBox(
                          width: 5,
                        ),
                        Box(text: "2 MC", ontap: (){}),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BackBtn(text: "Back", ontap: (){
                          Navigator.pop(context);
                        })
                      ],
                    )





                  ],
                )),
          ),
        ],
      ),
    );
  }
}
