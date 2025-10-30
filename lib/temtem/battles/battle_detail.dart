import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'battle.dart';

class BattleDetailScreen extends StatelessWidget {
  final Battle battle;

  const BattleDetailScreen({super.key, required this.battle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Battle")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AutoSizeText('name: ${battle.name}'),
        ],
      ),
    );
  }
}
