





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/toast message.dart';
import 'DataTable.dart';

class DevA2KDataStore extends StatefulWidget {
  const DevA2KDataStore({super.key});

  @override
  State<DevA2KDataStore> createState() => _DevA2KDataStoreState();
}

class _DevA2KDataStoreState extends State<DevA2KDataStore> {
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  // Controllers for each field
  final _phaseController = TextEditingController();
  final _realEstateController = TextEditingController();
  final _projectController = TextEditingController();
  final _blockController = TextEditingController();
  final _categoryController = TextEditingController();
  final _typeController = TextEditingController();
  final _natureController = TextEditingController();
  final _finishingController = TextEditingController();
  final _featuresController = TextEditingController();
  final _floorController = TextEditingController();
  final _sqYdsController = TextEditingController();
  final _inventoryController = TextEditingController();
  final _almtController = TextEditingController();
  final _refnoController = TextEditingController();
  final _nameofownerController = TextEditingController();
  final _cnicController = TextEditingController();
  final _sectorController = TextEditingController();
  final _plotnoController = TextEditingController();
  final _streetController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection("users");

  void _clearForm() {
    _phaseController.clear();
    _realEstateController.clear();
    _projectController.clear();
    _blockController.clear();
    _categoryController.clear();
    _typeController.clear();
    _natureController.clear();
    _finishingController.clear();
    _featuresController.clear();
    _floorController.clear();
    _sqYdsController.clear();
    _inventoryController.clear();
    _almtController.clear();
    _refnoController.clear();
    _nameofownerController.clear();
    _cnicController.clear();
    _sectorController.clear();
    _plotnoController.clear();
    _streetController.clear();
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true; // Start loading
      });

      String id = DateTime.now().microsecondsSinceEpoch.toString();

      fireStore.doc(id).set({
        "phase": _phaseController.text,
        "realEstate": _realEstateController.text,
        "projectName": _projectController.text,
        "block": _blockController.text,
        "category": _categoryController.text,
        "type": _typeController.text,
        "nature": _natureController.text,
        "finishing": _finishingController.text,
        "features": _featuresController.text,
        "floor": _floorController.text,
        "sq yds": _sqYdsController.text,
        "inventory status": _inventoryController.text,
        "almnt": _almtController.text,
        "ref no": _refnoController.text,
        "name of owner": _nameofownerController.text,
        "cnic": _cnicController.text,
        "sector": _sectorController.text,
        "plot no": _plotnoController.text,
        "street": _streetController.text,
        "id": id,
      }).then((value) {
        setState(() {
          isLoading = false; // Stop loading
        });
        _clearForm();
        message().toastmessage("Data Added Successfully");
      }).onError((error, stackTrace) {
        setState(() {
          isLoading = false; // Stop loading
        });
        message().toastmessage(error.toString());
      });
    } else {
      message().toastmessage("Please fill the form!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff808836),
        title: Text(
          "DEVELOP SECTOR",
          style: GoogleFonts.jotiOne(
            textStyle: const TextStyle(fontSize: 28, color: Colors.white),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff808836),
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                  child: Text("DHA BAHAWALPUR \n      INVENTORY",
                      style: GoogleFonts.jotiOne(
                          textStyle:
                          const TextStyle(fontSize: 20, color: Colors.white))),
                )),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DevDataTable()));
              },
              child: ListTile(
                title: Text(
                  "Data Table",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: Colors.white)),
                ),
                leading: const Icon(
                  Icons.table_view_outlined,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Residential Plots",
                  style: GoogleFonts.montaguSlab(
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  "A 2Kanal",
                  style: GoogleFonts.montaguSlab(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _refnoController,
                              decoration: const InputDecoration(
                                labelText: 'Reference No',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _nameofownerController,
                              decoration: const InputDecoration(
                                labelText: 'Name of Owner',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _inventoryController,
                              decoration: const InputDecoration(
                                labelText: 'Inventory Status',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _almtController,
                              decoration: const InputDecoration(
                                labelText: 'Almt',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _phaseController,
                              decoration: const InputDecoration(
                                labelText: 'Phase',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          // _buildFormField(_finishingController, 'Finishing'),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _featuresController,
                              decoration: const InputDecoration(
                                labelText: 'Features',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _floorController,
                              decoration: const InputDecoration(
                                labelText: 'Floor',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _sqYdsController,
                              decoration: const InputDecoration(
                                labelText: 'Sq Yds',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _natureController,
                              decoration: const InputDecoration(
                                labelText: 'Nature',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _finishingController,
                              decoration: const InputDecoration(
                                labelText: 'Finishing',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: _cnicController,
                              decoration: const InputDecoration(
                                labelText: 'CNIC',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _sectorController,
                              decoration: const InputDecoration(
                                labelText: 'Sector',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _plotnoController,
                              decoration: const InputDecoration(
                                labelText: 'Plot No',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _streetController,
                              decoration: const InputDecoration(
                                labelText: 'Street',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _realEstateController,
                              decoration: const InputDecoration(
                                labelText: 'Real Estate Type',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _projectController,
                              decoration: const InputDecoration(
                                labelText: 'Project Name',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _blockController,
                              decoration: const InputDecoration(
                                labelText: 'Block',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: _categoryController,
                              decoration: const InputDecoration(
                                labelText: 'Category',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _typeController,
                              decoration: const InputDecoration(
                                labelText: 'Type',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xff80AF81)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: isLoading ? null : _submitData,
                            child: isLoading
                                ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3.0,
                              ),
                            )
                                : const Text(
                              'Add',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


























// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../components/toast message.dart';
//
// class DevA2KDataStore extends StatefulWidget {
//   const DevA2KDataStore({super.key});
//
//   @override
//   State<DevA2KDataStore> createState() => _DevA2KDataStoreState();
// }
//
// class _DevA2KDataStoreState extends State<DevA2KDataStore> {
//   final _formKey = GlobalKey<FormState>();
//   final _phaseController = TextEditingController();
//   final _realestaeController = TextEditingController();
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
//
//   final fireStore = FirebaseFirestore.instance.collection("users");
//
//   List<DataRow> _rows = [];
//
//   void _addRow() {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _rows.add(DataRow(cells: [
//           DataCell(Text((_rows.length + 1).toString())), // Serial Number
//           DataCell(Text(_phaseController.text)),
//           DataCell(Text(_realestaeController.text)),
//           DataCell(Text(_projectController.text)),
//           DataCell(Text(_blockController.text)),
//           DataCell(Text(_categoryController.text)),
//           DataCell(Text(_typeController.text)),
//           DataCell(Text(_natureController.text)),
//           DataCell(Text(_finishingController.text)),
//           DataCell(Text(_featuresController.text)),
//           DataCell(Text(_floorController.text)),
//           DataCell(Text(_sqYdsController.text)),
//           DataCell(Text(_inventoryController.text)),
//         ]));
//         _phaseController.clear();
//         _realestaeController.clear();
//         _projectController.clear();
//         _blockController.clear();
//         _categoryController.clear();
//         _typeController.clear();
//         _natureController.clear();
//         _finishingController.clear();
//         _featuresController.clear();
//         _floorController.clear();
//         _sqYdsController.clear();
//         _inventoryController.clear();
//       });
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
//               textStyle: const TextStyle(fontSize: 28, color: Colors.white)),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(14.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Residential Plots",
//                   style: GoogleFonts.montaguSlab(
//                       textStyle: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.w700)),
//                 ),
//                 Text(
//                   "A 2Kanal",
//                   style: GoogleFonts.montaguSlab(
//                       textStyle: const TextStyle(
//                           fontSize: 16, fontWeight: FontWeight.w700)),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Form(
//                 key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _phaseController,
//                             decoration: const InputDecoration(
//                               labelText: 'Phase',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _realestaeController,
//                             decoration: const InputDecoration(
//                               labelText: 'Real Estate Type',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
// //                           width: 150,
// //                           child: TextFormField(
// //                             controller: _projectController,
// //                             decoration: const InputDecoration(
// //                               labelText: 'Project Name',
// //                               enabledBorder: OutlineInputBorder(
// //                                 borderSide:
// //                                     BorderSide(color: Color(0xff80AF81)),
// //                               ),
// //                               focusedBorder: OutlineInputBorder(
// //                                 borderSide:
// //                                     BorderSide(color: Color(0xff80AF81)),
// //                               ),
// //                             ),
// //                             validator: (value) {
// //                               if (value == null || value.isEmpty) {
// //                                 return 'Required';
// //                               }
// //                               return null;
// //                             },
// //                           ),
// //                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _blockController,
//                             decoration: const InputDecoration(
//                               labelText: 'Block',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _categoryController,
//                             decoration: const InputDecoration(
//                               labelText: 'Category',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _typeController,
//                             decoration: const InputDecoration(
//                               labelText: 'Type',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _natureController,
//                             decoration: const InputDecoration(
//                               labelText: 'Nature',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _finishingController,
//                             decoration: const InputDecoration(
//                               labelText: 'Finishing',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _featuresController,
//                             decoration: const InputDecoration(
//                               labelText: 'Features',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _floorController,
//                             decoration: const InputDecoration(
//                               labelText: 'Floor',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _sqYdsController,
//                             decoration: const InputDecoration(
//                               labelText: 'Sq Yds',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           child: TextFormField(
//                             controller: _inventoryController,
//                             decoration: const InputDecoration(
//                               labelText: 'Inventory Status',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff80AF81)),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//
//                         // Add Button
//
//                         ElevatedButton(
//                           // onPressed: _addRow,
//                           onPressed: () {
//                             setState(() {
//                               if (_inventoryController.value == "" ||
//                                   _sqYdsController.value == "" ||
//                                   _floorController.value == "" ||
//                                   _phaseController.value == "" ||
//                                   _realestaeController.value == "" ||
//                                   _projectController.value == "" ||
//                                   _blockController.value == "" ||
//                                   _categoryController.value == "" ||
//                                   _typeController.value == "" ||
//                                   _natureController.value == "" ||
//                                   _finishingController.value == "" ||
//                                   _featuresController.value == "") {
//                                 message().toastmessage("Please fill the form!");
//                               } else {
//                                 String id = DateTime.now()
//                                     .microsecondsSinceEpoch
//                                     .toString();
//
//                                 fireStore.doc(id).set({
//                                   "phase": _phaseController.text.toString(),
//                                   "realEstate":
//                                       _realestaeController.text.toString(),
//                                   "project Name":
//                                       _projectController.text.toString(),
//                                   "block": _blockController.text.toString(),
//                                   "category":
//                                       _categoryController.text.toString(),
//                                   "type": _typeController.text.toString(),
//                                   "nature": _natureController.text.toString(),
//                                   "finishing":
//                                       _finishingController.text.toString(),
//                                   "feature":
//                                       _featuresController.text.toString(),
//                                   "floor": _floorController.text.toString(),
//                                   "sqYds": _sqYdsController.text.toString(),
//                                   "inventory":
//                                       _inventoryController.text.toString(),
//                                   "id": id,
//                                 }).then((value) {
//                                   _addRow();
//                                   message()
//                                       .toastmessage("Data Added Successfully");
//
//                                   _phaseController.text = "";
//                                   _realestaeController.text = "";
//                                   _projectController.text = "";
//                                   _blockController.text = "";
//                                   _categoryController.text = "";
//                                   _typeController.text = "";
//                                   _natureController.text = "";
//                                   _finishingController.text = "";
//                                   _floorController.text = "";
//                                   _sqYdsController.text = "";
//                                   _inventoryController.text = "";
//                                 }).onError((error, stackTrace) {
//                                   setState(() {
//                                     message().toastmessage(error.toString());
//                                   });
//                                 });
//                               }
//                             });
//                           },
//
//                           child: const Text('Add'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Expanded(
//             flex: 4,
//             child: ListView(
//               children: [
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: DataTable(
//                       border: TableBorder.all(color: const Color(0xff80AF81)),
//                       columns: const [
//                         DataColumn(label: Text('Sr No.')),
//                         DataColumn(label: Text('Phase')),
//                         DataColumn(label: Text('Real Estate Type')),
//                         DataColumn(label: Text('Project Name')),
//                         DataColumn(label: Text('Block')),
//                         DataColumn(label: Text('Category')),
//                         DataColumn(label: Text('Type')),
//                         DataColumn(label: Text('Nature')),
//                         DataColumn(label: Text('Finishing')),
//                         DataColumn(label: Text('Features')),
//                         DataColumn(label: Text('Floor')),
//                         DataColumn(label: Text('Sq Yds')),
//                         DataColumn(label: Text('Inventory Status')),
//                       ],
//                       rows: _rows,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ------------above all right----------------------

// Expanded(
//   flex: 4,
//   child: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: DataTable(
//           border: TableBorder.all(color: const Color(0xff80AF81)),
//           columns: const [
//             DataColumn(label: Text('Sr No.')),
//             DataColumn(label: Text('Phase')),
//             DataColumn(label: Text('Real Estate Type')),
//             DataColumn(label: Text('Project Name')),
//             DataColumn(label: Text('Block')),
//             DataColumn(label: Text('Category')),
//             DataColumn(label: Text('Type')),
//             DataColumn(label: Text('Nature')),
//             DataColumn(label: Text('Finishing')),
//             DataColumn(label: Text('Features')),
//             DataColumn(label: Text('Floor')),
//             DataColumn(label: Text('Sq Yds')),
//             DataColumn(label: Text('Inventory Status')),
//           ],
//           rows: _rows),
//     ),
//   ),
// ),

// --------------------------------------------------------

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
//
// class DevA2KDataStore extends StatefulWidget {
//   const DevA2KDataStore({super.key});
//
//   @override
//   State<DevA2KDataStore> createState() => _DevA2KDataStoreState();
// }
//
// class _DevA2KDataStoreState extends State<DevA2KDataStore> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DataTable(
//           columns: _createColumn(),
//           rows: []),
//     );
//
//     // Padding(
//     //   padding: const EdgeInsets.all(16),
//     //   child: DataTable2(
//     //       columnSpacing: 12,
//     //       horizontalMargin: 12,
//     //       minWidth: 600,
//     //       columns: [
//     //         DataColumn2(
//     //           label: Text('Column A'),
//     //           size: ColumnSize.L,
//     //         ),
//     //         DataColumn(
//     //           label: Text('Column B'),
//     //         ),
//     //         DataColumn(
//     //           label: Text('Column C'),
//     //         ),
//     //         DataColumn(
//     //           label: Text('Column D'),
//     //         ),
//     //         DataColumn(
//     //           label: Text('Column NUMBERS'),
//     //           numeric: true,
//     //         ),
//     //       ],
//     //       rows:
//     //       List<DataRow>.generate(
//     //           100,
//     //               (index) => DataRow(cells: [
//     //             DataCell(Text('A' * (10 - index % 10))),
//     //             DataCell(Text('B' * (10 - (index + 5) % 10))),
//     //             DataCell(Text('C' * (15 - (index + 5) % 10))),
//     //             DataCell(Text('D' * (15 - (index + 10) % 10))),
//     //             DataCell(Text(((index + 0.1) * 25.4).toString()))
//     //           ]))
//     //   ),
//     // );
//
//     //   Scaffold(
//     //   appBar: AppBar(title: Text('Data Table')),
//     //   body: FutureBuilder<QuerySnapshot>(
//     //     future: firestore.collection('plots').get(),
//     //     builder: (context, snapshot) {
//     //       if (snapshot.connectionState == ConnectionState.waiting) {
//     //         return Center(child: CircularProgressIndicator());
//     //       } else if (snapshot.hasError) {
//     //         return Center(child: Text('Error: ${snapshot.error}'));
//     //       } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//     //         return Center(child: Text('No data found'));
//     //       }
//     //
//     //       var data = snapshot.data!.docs;
//     //       return SingleChildScrollView(
//     //         scrollDirection: Axis.horizontal,
//     //         child: DataTable(columns: [
//     //           DataColumn(label: Text('Sr #')),
//     //           DataColumn(label: Text('Name')),
//     //           DataColumn(label: Text('Reference #')),
//     //           DataColumn(label: Text('Plot #')),
//     //           DataColumn(label: Text('Category')),
//     //           DataColumn(label: Text('Plot Size')),
//     //           DataColumn(label: Text('Sector')),
//     //           DataColumn(label: Text('Phase')),
//     //           DataColumn(label: Text('CNIC')),
//     //         ], rows: data.map<DataRow>((doc) {
//     //           var docData = doc.data() as Map<String, dynamic>;
//     //           return DataRow(cells: [
//     //             DataCell(Text(docData['Sr #'].toString())),
//     //             DataCell(Text(docData['Name'])),
//     //             DataCell(Text(docData['Reference #'])),
//     //             DataCell(Text(docData['Plot #'].toString())),
//     //             DataCell(Text(docData['Category'])),
//     //             DataCell(Text(docData['Plot Size'])),
//     //             DataCell(Text(docData['Sector'])),
//     //             DataCell(Text(docData['Phase'])),
//     //             DataCell(Text(docData['CNIC'])),
//     //           ]);
//     //         }).toList()),
//     //       );
//     //     },
//     //   ),
//     // );
//   }
//
//   List<DataColumn> _createColumn() {
//     return [
//       const DataColumn(label: Text("Phase")),
//       const DataColumn(label: Text("Real Estate Type")),
//       const DataColumn(label: Text("Project Names")),
//     ];
//   }
// }
