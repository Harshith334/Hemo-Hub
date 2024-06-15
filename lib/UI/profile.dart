import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, String>> questions;

  const ProfilePage({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('User Profile', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const ListTile(
            title: Text('Name:'), // Add user's name here
          ),
          const ListTile(
            title: Text('BMI Index:'), // Add BMI index calculation here
          ),
          const Divider(),
          const ListTile(
            title: Text('Answers', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: questions.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  questions[index]['question']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(questions[index]['answer']!),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
