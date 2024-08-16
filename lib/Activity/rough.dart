//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../components/toast message.dart';
// import 'DevCat/DataTable.dart';
//
// class DevA2KDataStore extends StatefulWidget {
//   const DevA2KDataStore({super.key});
//
//   @override
//   State<DevA2KDataStore> createState() => _DevA2KDataStoreState();
// }
//
// class _DevA2KDataStoreState extends State<DevA2KDataStore> {
//   bool isLoading = false;
//
//   final _formKey = GlobalKey<FormState>();
//
//   // Controllers for each field
//   final _phaseController = TextEditingController();
//   final _realEstateController = TextEditingController();
//   final _projectController = TextEditingController();
//   final _blockController = TextEditingController();
//   final _categoryController = TextEditingController();
//   final _typeController = TextEditingController();
//   final _natureController = TextEditingController();
//   final _finishingController = TextEditingController();
//   final _featuresController = TextEditingController();
//   final _floorController = TextEditingController();
//   final _sqYdsController = TextEditingController();
//   final _inventoryController = TextEditingController();
//   final _almtController = TextEditingController();
//   final _refnoController = TextEditingController();
//   final _nameofownerController = TextEditingController();
//   final _cnicController = TextEditingController();
//   final _sectorController = TextEditingController();
//   final _plotnoController = TextEditingController();
//   final _streetController = TextEditingController();
//
//   final fireStore = FirebaseFirestore.instance.collection("users");
//
//   void _clearForm() {
//     _phaseController.clear();
//     _realEstateController.clear();
//     _projectController.clear();
//     _blockController.clear();
//     _categoryController.clear();
//     _typeController.clear();
//     _natureController.clear();
//     _finishingController.clear();
//     _featuresController.clear();
//     _floorController.clear();
//     _sqYdsController.clear();
//     _inventoryController.clear();
//     _almtController.clear();
//     _refnoController.clear();
//     _nameofownerController.clear();
//     _cnicController.clear();
//     _sectorController.clear();
//     _plotnoController.clear();
//     _streetController.clear();
//   }
//
//   void _submitData() {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         isLoading = true; // Start loading
//       });
//
//       String id = DateTime.now().microsecondsSinceEpoch.toString();
//
//       fireStore.doc(id).set({
//         "phase": _phaseController.text,
//         "realEstate": _realEstateController.text,
//         "projectName": _projectController.text,
//         "block": _blockController.text,
//         "category": _categoryController.text,
//         "type": _typeController.text,
//         "nature": _natureController.text,
//         "finishing": _finishingController.text,
//         "features": _featuresController.text,
//         "floor": _floorController.text,
//         "sq yds": _sqYdsController.text,
//         "inventory status": _inventoryController.text,
//         "almnt": _almtController.text,
//         "ref no": _refnoController.text,
//         "name of owner": _nameofownerController.text,
//         "cnic": _cnicController.text,
//         "sector": _sectorController.text,
//         "plot no": _plotnoController.text,
//         "street": _streetController.text,
//         "id": id,
//       }).then((value) {
//         setState(() {
//           isLoading = false; // Stop loading
//         });
//         _clearForm();
//         message().toastmessage("Data Added Successfully");
//       }).onError((error, stackTrace) {
//         setState(() {
//           isLoading = false; // Stop loading
//         });
//         message().toastmessage(error.toString());
//       });
//     } else {
//       message().toastmessage("Please fill the form!");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0xff808836),
//         title: Text(
//           "DEVELOP SECTOR",
//           style: GoogleFonts.jotiOne(
//             textStyle: const TextStyle(fontSize: 28, color: Colors.white),
//           ),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       drawer: Drawer(
//         backgroundColor: Color(0xff808836),
//         child: ListView(
//           children: [
//             DrawerHeader(
//                 child: Center(
//               child: Text("DHA BAHAWALPUR \n      INVENTORY",
//                   style: GoogleFonts.jotiOne(
//                       textStyle:
//                           const TextStyle(fontSize: 20, color: Colors.white))),
//             )),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const DevDataTable()));
//               },
//               child: ListTile(
//                 title: Text(
//                   "Data Table",
//                   style: GoogleFonts.lato(
//                       textStyle: const TextStyle(color: Colors.white)),
//                 ),
//                 leading: const Icon(
//                   Icons.table_view_outlined,
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Residential Plots",
//                   style: GoogleFonts.montaguSlab(
//                     textStyle: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.w700),
//                   ),
//                 ),
//                 Text(
//                   "A 2Kanal",
//                   style: GoogleFonts.montaguSlab(
//                     textStyle: const TextStyle(
//                         fontSize: 16, fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Form(
//               key: _formKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _refnoController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Reference No',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _nameofownerController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Name of Owner',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _inventoryController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Inventory Status',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 150,
//                             child: TextFormField(
//                               controller: _almtController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Almt',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _phaseController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Phase',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           // _buildFormField(_finishingController, 'Finishing'),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 150,
//                             child: TextFormField(
//                               controller: _featuresController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Features',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 150,
//                             child: TextFormField(
//                               controller: _floorController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Floor',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _sqYdsController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Sq Yds',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 150,
//                             child: TextFormField(
//                               controller: _natureController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Nature',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 150,
//                             child: TextFormField(
//                               controller: _finishingController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Finishing',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                   BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                   BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 250,
//                             child: TextFormField(
//                               controller: _cnicController,
//                               decoration: const InputDecoration(
//                                 labelText: 'CNIC',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 150,
//                             child: TextFormField(
//                               controller: _sectorController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Sector',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _plotnoController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Plot No',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _streetController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Street',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _realEstateController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Real Estate Type',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _projectController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Project Name',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 150,
//                             child: TextFormField(
//                               controller: _blockController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Block',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 200,
//                             child: TextFormField(
//                               controller: _categoryController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Category',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           SizedBox(
//                             width: 150,
//                             child: TextFormField(
//                               controller: _typeController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Type',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xff80AF81)),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Required';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.red),
//                             onPressed: isLoading ? null : _submitData,
//                             child: isLoading
//                                 ? const SizedBox(
//                                     width: 16,
//                                     height: 16,
//                                     child: CircularProgressIndicator(
//                                       color: Colors.white,
//                                       strokeWidth: 3.0,
//                                     ),
//                                   )
//                                 : const Text(
//                                     'Add',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
