import 'package:flapi/main.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  TextEditingController nameController = TextEditingController();
  late String name;
  bool resultadoIsVisible = false;
  bool isLoading = false;
  var gender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "GENERO",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              controller: nameController,
              onChanged: (text) {
                name = nameController.text;
              },
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Digita un nombre"),
            ),
          ),
          const Divider(),
          Container(
            width: 200,
            child: MaterialButton(
              color: Colors.white,
              onPressed: () {
                networking(name);
                setState(() {
                  isLoading = true;
                });
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    resultadoIsVisible = true;
                    isLoading = false;
                  });
                });
              },
              child: const Text(
                "Predecir Género",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Divider(),
          const Divider(),
          Visibility(
              visible: isLoading,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CircularProgressIndicator(),
              )),
          Visibility(
              visible: resultadoIsVisible,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Genero: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                        Text(
                          gender,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const Divider(),
                    const Divider(),
                    mostrarAlgo(),
                    const Divider(),
                    const Divider(),
                    Container(
                      child: ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home())),
                              },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.home_filled,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Regresar a Portada",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ))
        ],
      )),
    );
  }

  void networking(var name) async {
    var dio = Dio();
    try {
      final response = await dio.get("https://api.genderize.io/?name=$name");
      gender = response.data["gender"];
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Widget mostrarAlgo() {
    if (gender == "male") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/blue.jpg"),
        radius: 100,
      );
    } else {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/pink.jpg"),
        radius: 100,
      );
    }
  }
}
