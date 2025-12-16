import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/techniques/technique.dart';

class TechniqueDetailScreen extends StatefulWidget {
  const TechniqueDetailScreen({super.key, required this.technique});

  final Technique technique;

  @override
  State<StatefulWidget> createState() {
    return _TechniqueDetailScreenState();
  }
}

class _TechniqueDetailScreenState extends State<TechniqueDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text(widget.technique.name)),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoSizeText('courseId: ${widget.technique.courseId}'),
              AutoSizeText('courseStatus: ${widget.technique.courseStatus}'),
              AutoSizeText('type: ${widget.technique.type}'),
              AutoSizeText('synergy: ${widget.technique.synergy}'),
              AutoSizeText('category: ${widget.technique.category}'),
              AutoSizeText('targeting: ${widget.technique.targeting}'),
              AutoSizeText('damage: ${widget.technique.damage}'),
              AutoSizeText('staminaCost: ${widget.technique.staminaCost}'),
              AutoSizeText('hold: ${widget.technique.hold}'),
              AutoSizeText('priority: ${widget.technique.priority}'),
            ],
          ),
        )));
  }
}
