import 'package:flutter/material.dart';

void main() {
  runApp(const DonorsApp());
}

class DonorsApp extends StatelessWidget {
  const DonorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DonorsPage2(),
    );
  }
}

class DonorsPage2 extends StatelessWidget {
  const DonorsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donors'),
      ),
      body: ListView.builder(
        itemCount: 20, // Number of donors
        itemBuilder: (context, index) {
          // Generate donor details
          return DonorCard(
            name: 'Donor ${index + 1}',
            bloodGroup: 'Blood Group ${index + 1}',
            contact: 'Contact ${index + 1}',
            email: 'Email ${index + 1}',
            lastDonationDate: DateTime.now(), // Placeholder for last donation date
          );
        },
      ),
    );
  }
}

class DonorCard extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String contact;
  final String email;
  final DateTime lastDonationDate; // Add last donation date property

  const DonorCard({
    super.key,
    required this.name,
    required this.bloodGroup,
    required this.contact,
    required this.email,
    required this.lastDonationDate, // Update constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, // Background color
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: $name',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Blood Group: $bloodGroup',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Contact: $contact',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Email: $email',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Calculate the difference between the current date and the last donation date
                  Duration difference = DateTime.now().difference(lastDonationDate);
                  bool isEligible = true; // Assume donor is eligible initially
                  
                  // Check if the difference is less than 6 months (approximately 180 days)
                  if (difference.inDays < 180) {
                    isEligible = false;
                  }
                  
                  // Show a dialog with the verification result
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Verification Result'),
                        content: Text(isEligible ? 'Eligible to donate' : 'Not eligible to donate'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Verify'),
              ),
              const SizedBox(width: 8.0), // Add space between buttons
              ElevatedButton(
                onPressed: () {
                  // Navigate to the image page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ImagePage()), // Define ImagePage route
                  );
                },
                child: const Text('Locate'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
        child: Image.asset("maps.png"),
      ),
    );
  }
}
