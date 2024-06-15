import 'package:flutter/material.dart';

void main() {
  runApp(const BloodRequestApp());
}

class BloodRequestApp extends StatelessWidget {
  const BloodRequestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BloodRequestScreen(),
    );
  }
}

class BloodRequestScreen extends StatelessWidget {
  final List<Map<String, String>> requests = [
    {
      'name': 'sachin',
      'age': '30',
      'reason': 'fever',
      'bloodGroup': 'B-',
      'units': '2',
      'date': 'Feb. 14, 2021',
      'status': 'Pending'
    },
    {
      'name': 'mona',
      'age': '26',
      'reason': 'dengu',
      'bloodGroup': 'AB+',
      'units': '2',
      'date': 'Feb. 14, 2021',
      'status': 'Pending'
    }
  ];

  BloodRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Requested'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Stock Does Not Have Enough Blood To Approve This Request, Only 1 Unit Available',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Patient Name')),
                  DataColumn(label: Text('Age')),
                  DataColumn(label: Text('Reason')),
                  DataColumn(label: Text('Blood Group')),
                  DataColumn(label: Text('Unit (in ml)')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Action')),
                ],
                rows: requests.map((request) {
                  return DataRow(cells: [
                    DataCell(Text(request['name']!)),
                    DataCell(Text(request['age']!)),
                    DataCell(Text(request['reason']!)),
                    DataCell(Text(request['bloodGroup']!)),
                    DataCell(Text(request['units']!)),
                    DataCell(Text(request['date']!)),
                    DataCell(Text(request['status']!)),
                    DataCell(Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text('Approve'),
                        ),
                        const SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Reject'),
                        ),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
