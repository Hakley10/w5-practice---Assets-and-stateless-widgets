import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hobbiess Demo',
      home: MyHobbies(),
    );
  }
}

class MyHobbies extends StatelessWidget {
  const MyHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 155, 154, 154),
      appBar: AppBar(title: const Text('My Hobbies')),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HobbyCard(
              title: 'Traveling',
              icon: Icons.travel_explore,
              backgroundColor: Color.fromARGB(255, 2, 180, 41),
            ),
            SizedBox(height: 10),
            HobbyCard(
              title: 'Skating',
              icon: Icons.skateboarding,
              backgroundColor: Color.fromARGB(255, 63, 134, 192),
            ),
            SizedBox(height: 10),
            HobbyCard(
              title: 'Soccer',
              icon: Icons.sports_soccer,
              backgroundColor: Color.fromARGB(255, 192, 63, 134),
            ),
          ],
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue, // Default value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(icon, size: 25, color: Colors.white),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
