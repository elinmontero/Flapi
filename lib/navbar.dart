import 'package:flapi/views/age.dart';
import 'package:flapi/views/college.dart';
import 'package:flapi/views/gender.dart';
import 'package:flapi/views/info.dart';
import 'package:flapi/views/newspaper.dart';
import 'package:flapi/views/weather.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/ciel.jpg"),
                    fit: BoxFit.cover)),
            child: Text(
              "Ir a",
              style: TextStyle(fontSize: 35, color: Colors.deepPurple),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person_2_sharp,
              color: Colors.white,
            ),
            title: const Text(
              'Género',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Gender()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: const Text('Edad',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic)),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Age()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.school_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'Universidades',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const College()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.storm_rounded,
              color: Colors.white,
            ),
            title: const Text('Clima ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic)),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Weather()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.newspaper_sharp,
              color: Colors.white,
            ),
            title: const Text('Noticias',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic)),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Newspaper()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            title: const Text('Contacto',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic)),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Info()))
            },
          ),
        ],
      ),
    );
  }
}
