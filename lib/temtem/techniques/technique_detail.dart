import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/techniques/technique.dart';

class TechniqueDetailScreen extends StatelessWidget {
  final Technique technique;

  const TechniqueDetailScreen({super.key, required this.technique});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Technique")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AutoSizeText('name: ${technique.name}'),
          AutoSizeText('courseId: ${technique.courseId}'),
          AutoSizeText('courseStatus: ${technique.courseStatus}'),
          AutoSizeText('type: ${technique.type}'),
          AutoSizeText('synergy: ${technique.synergy}'),
          AutoSizeText('category: ${technique.category}'),
          AutoSizeText('targeting: ${technique.targeting}'),
          AutoSizeText('damage: ${technique.damage}'),
          AutoSizeText('staminaCost: ${technique.staminaCost}'),
          AutoSizeText('hold: ${technique.hold}'),
          AutoSizeText('priority: ${technique.priority}'),
        ],
      ),
    );
  }
}
