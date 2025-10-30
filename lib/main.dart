import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/temtem_homepage.dart';

void main() {
  runApp(const GamesApp());
}

class GamesApp extends StatelessWidget {
  const GamesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const GamesHomePage(),
    );
  }
}

class GamesHomePage extends StatelessWidget {
  const GamesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text("Games")),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TemtemHomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(100),
                      backgroundColor: Colors.blueGrey[200]),
                  child: const AutoSizeText(
                    'Temtem',
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    maxLines: 1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(100),
                      backgroundColor: Colors.blueGrey[200]),
                  child: const AutoSizeText(
                    'Marvel Future Fight',
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    maxLines: 1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(100),
                      backgroundColor: Colors.blueGrey[200]),
                  child: const AutoSizeText(
                    'DC Worlds Collide',
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    maxLines: 1,
                  ),
                )
              ],
            )));
  }
}
