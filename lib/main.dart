import 'package:flutter/material.dart';

import 'navbar.dart';

void main() => runApp(const ApiFlutter());

class ApiFlutter extends StatelessWidget {
  const ApiFlutter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ApiFlutter ',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        drawer: const NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "MENU",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: const [
            Icon(
              Icons.person_3_rounded,
              color: Colors.white,
              size: 80,
            ),
            Icon(
              Icons.school_rounded,
              color: Colors.white,
              size: 80,
            ),
            Icon(
              Icons.storm_rounded,
              color: Colors.white,
              size: 80,
            ),
            Icon(
              Icons.elderly,
              color: Colors.white,
              size: 80,
            ),
            Icon(
              Icons.newspaper_rounded,
              color: Colors.white,
              size: 80,
            ),
            Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
              size: 80,
            ),
          ],
        ));
  }
}
