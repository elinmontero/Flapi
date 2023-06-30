import 'package:flapi/main.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  TextEditingController nameController = TextEditingController();
  late String name;
  bool resultadoIsVisible = false;
  bool isLoading = false;
  var edad = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "EDAD",
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
                "Obtener la edad",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
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
                          "Edad: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                        Text(
                          edad,
                          style: const TextStyle(color: Colors.white),
                        )
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
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
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
                                    color: Colors.deepPurple,
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
      final response = await dio.get("https://api.agify.io/?name=$name");
      edad = response.data["age"].toString();
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Widget mostrarAlgo() {
    if (edad == "1") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text("Eres joven"),
      );
    } else if (edad == "2") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "3") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "4") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "5") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "6") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "7") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "8") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "9") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "10") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "11") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "12") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "13") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "14") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "15") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "16") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "17") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "18") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "19") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "20") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "21") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "22") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "23") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "24") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "25") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "26") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "27") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "28") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "29") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "30") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/juve.jpg"),
        radius: 100,
        child: Text(
          "Eres joven",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "31") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "32") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "33") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "34") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "35") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "36") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "37") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "38") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "39") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "40") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "41") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "42") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "43") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "44") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "45") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "46") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "47") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "48") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "49") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "50") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "51") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "52") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "53") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "54") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "55") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "56") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "57") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "58") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "59") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "60") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "61") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "62") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "63") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "64") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "65") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "66") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "67") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "68") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "69") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/adul.png"),
        radius: 100,
        child: Text(
          "Eres Adulto",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "70") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "71") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "72") {
      return const CircleAvatar(
        backgroundImage: AssetImage(
          "assets/images/edad3.jpg",
        ),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "73") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "74") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "75") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "76") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "77") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "78") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "79") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "80") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "81") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "82") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "83") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "84") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "85") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "86") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "87") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "88") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "89") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "90") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "91") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "92") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "93") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "94") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "95") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "96") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "97") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "98") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "99") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else if (edad == "100") {
      return const CircleAvatar(
        backgroundImage: AssetImage("assets/images/edad3.jpg"),
        radius: 100,
        child: Text(
          "Eres un adulto mayor ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return const Text("Mucho tiempo");
    }
  }
}
