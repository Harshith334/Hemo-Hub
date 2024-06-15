import 'package:flutter/material.dart';
import 'needblood.dart';
import 'donor.dart';
import 'login.dart';

void main() {
  runApp(const HemoHubApp());
}

class HemoHubApp extends StatelessWidget {
  const HemoHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank Management',
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.redAccent),
      ),
      home: const HemoHubPage(),
    );
  }
}

class HemoHubPage extends StatelessWidget {
  const HemoHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hemo Hub'),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Blood Bank Management',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Home', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Color.fromARGB(255, 250, 7, 7)),
              title: const Text('Profile', style: TextStyle(color: Color.fromARGB(255, 247, 0, 0))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people, color: Color.fromARGB(255, 186, 27, 27)),
              title: const Text('Patient', style: TextStyle(color: Color.fromARGB(255, 247, 0, 0))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PatientsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.volunteer_activism, color: Color.fromARGB(255, 247, 0, 0)),
              title: const Text('Donations', style: TextStyle(color: Color.fromARGB(255, 247, 0, 0))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DonationsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bloodtype, color: Color.fromARGB(255, 247, 0, 0)),
              title: const Text('Blood Requests', style: TextStyle(color: Color.fromARGB(255, 247, 0, 0))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BloodRequestPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Color.fromARGB(255, 247, 0, 0)),
              title: const Text('Request History', style: TextStyle(color: Color.fromARGB(255, 247, 0, 0))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RequestHistoryPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory, color: Color.fromARGB(255, 247, 0, 0)),
              title: const Text('Blood Stock', style: TextStyle(color: Color.fromARGB(255, 247, 0, 0))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BloodStockPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Replace LoginPage() with your desired logout page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage2()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MemberList()),
                );
              },
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(
                  'Need Blood',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DonorsPage2()),
                );
              },
              child: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  'Donate Blood',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> userProfile = {
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'bloodType': 'A+',
      'rewards': '5 Donations'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${userProfile['name']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0), fontSize: 18)),
            const SizedBox(height: 8),
            Text('Email: ${userProfile['email']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0), fontSize: 18)),
            const SizedBox(height: 8),
            Text('Blood Type: ${userProfile['bloodType']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0), fontSize: 18)),
            const SizedBox(height: 8),
            Text('Rewards: ${userProfile['rewards']}', style: const TextStyle(color:Color.fromARGB(255, 255, 0, 0), fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class DonorsPage extends StatelessWidget {
  const DonorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> donors = [
      {'name': 'John Doe', 'bloodType': 'A+', 'lastDonation': '2023-01-15'},
      {'name': 'Jane Smith', 'bloodType': 'B-', 'lastDonation': '2023-03-20'},
      // Add more donors here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Donors'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: donors.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person, color: Colors.red),
            title: Text(donors[index]['name']!, style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
            subtitle: Text('Blood Type: ${donors[index]['bloodType']}\nLast Donation: ${donors[index]['lastDonation']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
          );
        },
      ),
    );
  }
}

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> patients = [
      {'name': 'Alice Brown', 'bloodType': 'O+', 'needDate': '2023-06-01'},
      {'name': 'Bob Johnson', 'bloodType': 'AB-', 'needDate': '2023-07-15'},
      // Add more patients here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person, color: Colors.red),
            title: Text(patients[index]['name']!, style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
            subtitle: Text('Blood Type: ${patients[index]['bloodType']}\nNeed By: ${patients[index]['needDate']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
          );
        },
      ),
    );
  }
}

class DonationsPage extends StatelessWidget {
  const DonationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> donations = [
      {'donor': 'John Doe', 'recipient': 'Alice Brown', 'date': '2023-04-12'},
      {'donor': 'Jane Smith', 'recipient': 'Bob Johnson', 'date': '2023-05-08'},
      // Add more donations here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Donations'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: donations.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.volunteer_activism, color: Colors.red),
            title: Text('Donor: ${donations[index]['donor']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
            subtitle: Text('Recipient: ${donations[index]['recipient']}\nDate: ${donations[index]['date']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
          );
        },
      ),
    );
  }
}

class BloodRequestPage extends StatelessWidget {
  const BloodRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> requests = [
      {'name': 'Charlie Davis', 'bloodType': 'A+', 'requestDate': '2023-05-20'},
      {'name': 'Dana Evans', 'bloodType': 'B-', 'requestDate': '2023-05-30'},
      // Add more requests here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Requests'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.bloodtype, color: Colors.red),
            title: Text(requests[index]['name']!, style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
            subtitle: Text('Blood Type: ${requests[index]['bloodType']}\nRequest Date: ${requests[index]['requestDate']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
          );
        },
      ),
    );
  }
}

class RequestHistoryPage extends StatelessWidget {
  const RequestHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> history = [
      {'name': 'Eve Foster', 'bloodType': 'O+', 'requestDate': '2023-03-10', 'status': 'Fulfilled'},
      {'name': 'Frank Green', 'bloodType': 'AB-', 'requestDate': '2023-04-05', 'status': 'Pending'},
      // Add more history entries here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request History'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.history, color: Colors.red),
            title: Text(history[index]['name']!, style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
            subtitle: Text('Blood Type: ${history[index]['bloodType']}\nRequest Date: ${history[index]['requestDate']}\nStatus: ${history[index]['status']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
          );
        },
      ),
    );
  }
}

class BloodStockPage extends StatelessWidget {
  const BloodStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stock = [
      {'bloodType': 'A+', 'units': '10'},
      {'bloodType': 'B-', 'units': '5'},
      // Add more stock details here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Stock'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: stock.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.inventory, color: Colors.red),
            title: Text('Blood Type: ${stock[index]['bloodType']}', style: const TextStyle(color: Color.fromARGB(255, 255, 1, 1))),
            subtitle: Text('Units Available: ${stock[index]['units']}', style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
          );
        },
      ),
    );
  }
}

// Add your LoginPage widget here for logout redirection

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement
    // Implement your login page UI here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implement your logout logic here
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
