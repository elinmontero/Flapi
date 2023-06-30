import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class College extends StatefulWidget {
  const College({super.key});

  @override
  State<College> createState() => _CollegeState();
}

class _CollegeState extends State<College> {
  TextEditingController nameController = TextEditingController();
  late String country;
  bool resultadoIsVisible = false;
  bool isLoading = false;

  var name = "";
  var dominio = "";
  var link = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "UNIVERSIDADES",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
                country = nameController.text;
              },
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Digita un pais"),
            ),
          ),
          Container(
            width: 200,
            child: MaterialButton(
              color: Colors.white,
              onPressed: () {
                networking(country);
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
                "Obtener las universidades",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Visibility(
              visible: isLoading,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CircularProgressIndicator(),
              )),
          Visibility(
              visible: resultadoIsVisible,
              child: ListView(
                children: [Text(name)],
              ))
        ],
      )),
    );
  }

  void networking(var country) async {
    var dio = Dio();
    try {
      final response = await dio
          .get("http://universities.hipolabs.com/search?country=$country");
      name = response.data["name"];
      dominio = response.data["domains"];
      link = response.data["web_pages"];
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
