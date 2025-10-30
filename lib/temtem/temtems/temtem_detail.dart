import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/temtems/temtem.dart';

class TemtemDetailScreen extends StatelessWidget {
  final Temtem temtem;

  const TemtemDetailScreen({super.key, required this.temtem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Temtem")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AutoSizeText('name: ${temtem.name}'),
          AutoSizeText('teamStatus: ${temtem.teamStatus}'),
          AutoSizeText('types: ${temtem.types.toString()}'),
          AutoSizeText('weakTypes: ${temtem.weakTypes.toString()}'),
          AutoSizeText('superWeakTypes: ${temtem.superWeakTypes.toString()}'),
          AutoSizeText('strongTypes: ${temtem.strongTypes.toString()}'),
          AutoSizeText(
              'superStrongTypes: ${temtem.superStrongTypes.toString()}'),
          AutoSizeText('hitPoints: ${temtem.hitPoints}'),
          AutoSizeText('stamina: ${temtem.stamina}'),
          AutoSizeText('speed: ${temtem.speed}'),
          AutoSizeText('attack: ${temtem.attack}'),
          AutoSizeText('defense: ${temtem.defense}'),
          AutoSizeText('specialAttack: ${temtem.specialAttack}'),
          AutoSizeText('specialDefense: ${temtem.specialDefense}'),
        ],
      ),
    );
  }
}
