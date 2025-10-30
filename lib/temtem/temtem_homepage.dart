import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/techniques/technique_list.dart';
import 'package:games_app/temtem/temtems/temtem_list.dart';

import 'battles/battle_list.dart';

class TemtemHomePage extends StatelessWidget {
  const TemtemHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text("Temtem")),
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
                            builder: (context) => const TemtemListScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(100),
                      backgroundColor: Colors.blueGrey[200]),
                  child: const AutoSizeText(
                    'Temtems',
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    maxLines: 1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TechniqueListScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(100),
                      backgroundColor: Colors.blueGrey[200]),
                  child: const AutoSizeText(
                    'Techniques',
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    maxLines: 1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BattleListScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(100),
                      backgroundColor: Colors.blueGrey[200]),
                  child: const AutoSizeText(
                    'Battles',
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    maxLines: 1,
                  ),
                )
              ],
            )));
  }
}
