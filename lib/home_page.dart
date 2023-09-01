import 'package:admin_panel_jcet/landing_page.dart';
import 'package:admin_panel_jcet/visitor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

User? user;
// Stream<QuerySnapshot>? usersStream;

late VistorDataSource vistorDataSource;

List<Visitor>? userdata;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    vistorDataSource = VistorDataSource(context, vistor: []); // Initialize with an empty list
    getData();
    super.initState();
  }

  getData() async {
    final usersStream = await FirebaseFirestore.instance.collection('Visitors').get();
    final userdata = usersStream.docs.map((e) => Visitor.fromSnapshot(e)).toList();
    setState(() {
      vistorDataSource = VistorDataSource(context, vistor: userdata);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Log Out'),
                    content: const Text('Are you sure to logOut!'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut().then((value) => Get.offAll(const AuthGate()));
                          },
                          child: const Text('Yes')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No'))
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SizedBox(
        height: 900,
        child: SfDataGrid(
          columnWidthMode: ColumnWidthMode.auto,
          gridLinesVisibility: GridLinesVisibility.none,
          source: vistorDataSource,
          // headerGridLinesVisibility: GridLinesVisibility.none,
          // allowFiltering: false,
          // allowSwiping: false,
          columns: [
            GridColumn(
                columnName: 'Name',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Name',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                columnName: 'nricFin',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'nricFin',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                columnName: "CompanyName",
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'CompanyName',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                columnName: 'designation',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'designation',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                width: 150,
                columnName: 'phone',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'phone',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                columnName: 'Email',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Email',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                columnName: 'persontovisit',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'persontovisit',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                columnName: 'placetovisit',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'placetovisit',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                columnName: 'purpose',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'purpose',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                columnName: 'inTime',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'inTime',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                columnName: 'emergencyContact',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'emergencyContact',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                columnName: 'isHave-covidcertificate',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'isHave-covidcertificate',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                columnName: 'termsCondition',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'termsCondition',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                // width: getWidth(context) * 0.10,
                columnName: 'approved',
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'approved',
                      overflow: TextOverflow.ellipsis,
                    ))),
          ],
        ),
      ),
    );
  }
}

class VistorDataSource extends DataGridSource {
  final BuildContext context;

  VistorDataSource(this.context, {required List<Visitor> vistor}) {
    dataGridRows = vistor
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String?>(columnName: 'Name', value: dataGridRow.name),
              DataGridCell<String?>(columnName: 'nricFin', value: dataGridRow.nricFin),
              DataGridCell<String?>(columnName: 'CompanyName', value: dataGridRow.companyName),
              DataGridCell<String?>(columnName: 'designation', value: dataGridRow.designation),
              DataGridCell<String?>(columnName: 'phone', value: dataGridRow.phone.toString()),
              DataGridCell<String?>(columnName: 'Email', value: dataGridRow.email.toString()),
              DataGridCell<String?>(columnName: 'persontovisit', value: dataGridRow.persontovisit.toString()),
              DataGridCell<String?>(columnName: 'placetovisit', value: dataGridRow.placeofvisit.toString()),
              DataGridCell<String?>(columnName: 'purpose', value: dataGridRow.purposeofvisit.toString()),
              DataGridCell(
                  columnName: 'inTime', value: DateFormat('hh:mm a').format(DateTime.parse(dataGridRow.inTime!))),
              DataGridCell<String?>(columnName: 'emergencyContact', value: dataGridRow.emergencyContact.toString()),
              DataGridCell<String?>(
                  columnName: 'isHave-covidcertificate', value: dataGridRow.isHaveCovidCertificate.toString()),
              DataGridCell<String?>(columnName: 'termsCondition', value: dataGridRow.termsCondition.toString()),
              DataGridCell<String?>(columnName: 'approved', value: dataGridRow.approved.toString()),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600 // Set the font weight to bold
                ),
          ));
    }).toList());
  }
}
