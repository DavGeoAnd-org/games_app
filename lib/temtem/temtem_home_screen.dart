import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/techniques/techniques_screen.dart';
import 'package:games_app/temtem/temtems/temtems_screen.dart';

import '../main.dart';
import 'battles/battles_screen.dart';

class TemtemHomeScreen extends StatelessWidget {
  const TemtemHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text("Temtem")),
        body: SafeArea(
            minimum: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    navigatorKey.currentState?.push(
                      MaterialPageRoute(builder: (_) => const TemtemsScreen()),
                    );
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
                    navigatorKey.currentState?.push(
                      MaterialPageRoute(
                          builder: (_) => const TechniquesScreen()),
                    );
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
                    navigatorKey.currentState?.push(
                      MaterialPageRoute(builder: (_) => const BattlesScreen()),
                    );
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
