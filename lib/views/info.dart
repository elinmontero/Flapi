import 'package:flapi/main.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("PARA CONTACTO",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: Center(
        child: Column(
          children: [
            const Divider(),
            const Divider(),
            const Divider(),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/montero.jpg'),
              radius: 120,
            ),
            const Divider(),
            const Text(
              "ELIN ALGENES ENCARNACION MONTERO",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Divider(),
            const Text(
              "archyfamous24@gmail.com",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Divider(),
            const Text(
              "809-335-4496",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 120,
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home())),
                    },
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home_filled,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Regresar a Inicio",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepPurple),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
