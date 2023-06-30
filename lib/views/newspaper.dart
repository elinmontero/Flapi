import 'package:flapi/main.dart';
import 'package:flapi/models/noti.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Newspaper extends StatefulWidget {
  const Newspaper({super.key});

  @override
  State<Newspaper> createState() => _NewspaperState();
}

class _NewspaperState extends State<Newspaper> {
  late Future<List<Periodico>> _listadoposts;
  Future<List<Periodico>> post() async {
    final response = await http.get(
      "https://almomento.net/wp-json/wp/v2/posts" as Uri,
    );

    List<Periodico> news = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var item in jsonData["posts"]) {
        news.add(Periodico(item["title"], item["content"], item["guid"]));
      }
      return news;
    } else {
      throw Exception("falló la conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoposts = post();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "PUBLICACIONES",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/images/logoamn.png"),
            ),
            const Divider(),
            const Divider(),
            FutureBuilder(
              future: _listadoposts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: _listposts(snapshot.data),
                  );
                } else if (snapshot.hasError) {
                  return const Text("error");
                }
                return Container(
                  child: const CircularProgressIndicator(),
                );
              },
            ),
            const SizedBox(
              height: 300,
            ),
            Container(
              child: ElevatedButton(
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
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  )),
            )
          ],
        ));
  }

  List<Widget> _listposts(data) {
    List<Widget> posts = [];

    for (var post in data) {
      posts.add(Text(post.titulo));
    }
    return posts;
  }
}
