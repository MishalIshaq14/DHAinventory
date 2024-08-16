import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DevA2KDataStore.dart';

class DevDataTable extends StatefulWidget {
  const DevDataTable({Key? key}) : super(key: key);

  @override
  State<DevDataTable> createState() => _DevDataTableState();
}

class _DevDataTableState extends State<DevDataTable> {
  final _searchController = TextEditingController();
  List<Map<String, dynamic>> allData = [];
  List<Map<String, dynamic>> filteredData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      allData = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      filteredData = List.from(allData);
    });
  }

  void _filterData(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredData = List.from(allData);
      });
    } else {
      setState(() {
        filteredData = allData.where((data) {
          return data.values.any((value) =>
              value.toString().toLowerCase().contains(query.toLowerCase()));
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff808836),
        title: Text(
          "DATA TABLE",
          style: GoogleFonts.jotiOne(
            textStyle: const TextStyle(fontSize: 28, color: Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DevA2KDataStore()));
          },
          child: const Icon(
            Icons.add,
            size: 32,
            color: Colors.red,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                      color: Color(0xff808836)), // Change color when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Color(0xff808836)),
                ),
              ),
              onChanged: (query) => _filterData(query),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DataTable(
                    border: TableBorder.all(color: const Color(0xff80AF81)),
                    columns: const [
                      DataColumn(
                          label: Text(
                        'Sr No',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Phase',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text('Real Estate',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600))),
                      DataColumn(
                          label: Text(
                        'Project Name',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Block',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Category',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Type',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Nature',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Finishing',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Features',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Floor',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Sq Yds',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Inventory Status',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Almt',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Ref No',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Name of Owner',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'CNIC',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Sector',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Plot No',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Street',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                    ],
                    rows: filteredData.asMap().entries.map((entry) {
                      int index =
                          entry.key + 1; // Serial number (1-based index)
                      Map<String, dynamic> data = entry.value;

                      return DataRow(cells: [
                        DataCell(Text(index.toString())),
                        DataCell(Text(data['phase'] ?? '')),
                        DataCell(Text(data['realEstate'] ?? '')),
                        DataCell(Text(data['projectName'] ?? '')),
                        DataCell(Text(data['block'] ?? '')),
                        DataCell(Text(data['category'] ?? '')),
                        DataCell(Text(data['type'] ?? '')),
                        DataCell(Text(data['nature'] ?? '')),
                        DataCell(Text(data['finishing'] ?? '')),
                        DataCell(Text(data['features'] ?? '')),
                        DataCell(Text(data['floor'] ?? '')),
                        DataCell(Text(data['sq yds'] ?? '')),
                        DataCell(Text(data['inventory status'] ?? '')),
                        DataCell(Text(data['almnt'] ?? '')),
                        DataCell(Text(data['ref no'] ?? '')),
                        DataCell(Text(data['name of owner'] ?? '')),
                        DataCell(Text(data['cnic'] ?? '')),
                        DataCell(Text(data['sector'] ?? '')),
                        DataCell(Text(data['plot no'] ?? '')),
                        DataCell(Text(data['street'] ?? '')),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
