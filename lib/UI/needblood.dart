import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Member Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MemberList(),
    );
  }
}

class MemberList extends StatefulWidget {
  const MemberList({super.key});

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  final List<Map<String, String>> members = [
    {"name": "John Doe", "details": "Age: 30, Occupation: Engineer", "contact": "123-456-7890", "bloodGroup": "A+", "address": "123 Main St", "email": "john.doe@example.com"},
    {"name": "Jane Smith", "details": "Age: 25, Occupation: Doctor", "contact": "987-654-3210", "bloodGroup": "B+", "address": "456 Elm St", "email": "jane.smith@example.com"},
    {"name": "Alice Johnson", "details": "Age: 28, Occupation: Teacher", "contact": "456-789-1230", "bloodGroup": "O+", "address": "789 Pine St", "email": "alice.johnson@example.com"},
    {"name": "Bob Brown", "details": "Age: 32, Occupation: Lawyer", "contact": "321-654-9870", "bloodGroup": "AB+", "address": "321 Oak St", "email": "bob.brown@example.com"},
    // Add more members here...
  ];

  String? selectedBloodGroup;

  List<String> get bloodGroups {
    return members.map((member) => member['bloodGroup']!).toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredMembers = selectedBloodGroup == null
        ? members
        : members.where((member) => member['bloodGroup'] == selectedBloodGroup).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Member List'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                hint: const Text('Select Blood Group', style: TextStyle(color: Colors.black)),
                value: selectedBloodGroup,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBloodGroup = newValue;
                  });
                },
                items: bloodGroups.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredMembers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredMembers[index]['name']!,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              filteredMembers[index]['details']!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Contact: ${filteredMembers[index]['contact']!}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Address: ${filteredMembers[index]['address']!}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Email: ${filteredMembers[index]['email']!}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Blood Group: ${filteredMembers[index]['bloodGroup']!}",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
