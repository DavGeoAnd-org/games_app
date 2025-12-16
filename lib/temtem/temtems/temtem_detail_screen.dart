import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/temtems/temtem.dart';
import 'package:games_app/temtem/temtems/temtem_request.dart';

import '../techniques/technique.dart';

class TemtemDetailScreen extends StatefulWidget {
  const TemtemDetailScreen({super.key, required this.temtem});

  final Temtem temtem;

  @override
  State<StatefulWidget> createState() {
    return _TemtemDetailScreenState();
  }
}

class _TemtemDetailScreenState extends State<TemtemDetailScreen> {
  late Future<TemtemDetail> _temtemDetail;

  @override
  void initState() {
    super.initState();
    _temtemDetail = temtemDetail(widget.temtem.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text(widget.temtem.name)),
        body: SafeArea(
            child: FutureBuilder<TemtemDetail>(
          future: _temtemDetail,
          builder:
              (BuildContext context, AsyncSnapshot<TemtemDetail> snapshot) {
            if (snapshot.hasData) {
              TemtemDetail temtemDetail = snapshot.data!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText('teamStatus: ${widget.temtem.teamStatus}'),
                    AutoSizeText('types: ${widget.temtem.types.toString()}'),
                    AutoSizeText(
                        'weakTypes: ${widget.temtem.weakTypes.toString()}'),
                    AutoSizeText(
                        'superWeakTypes: ${widget.temtem.superWeakTypes.toString()}'),
                    AutoSizeText(
                        'strongTypes: ${widget.temtem.strongTypes.toString()}'),
                    AutoSizeText(
                        'superStrongTypes: ${widget.temtem.superStrongTypes.toString()}'),
                    AutoSizeText('hitPoints: ${widget.temtem.hitPoints}'),
                    AutoSizeText('stamina: ${widget.temtem.stamina}'),
                    AutoSizeText('speed: ${widget.temtem.speed}'),
                    AutoSizeText('attack: ${widget.temtem.attack}'),
                    AutoSizeText('defense: ${widget.temtem.defense}'),
                    AutoSizeText(
                        'specialAttack: ${widget.temtem.specialAttack}'),
                    AutoSizeText(
                        'specialDefense: ${widget.temtem.specialDefense}'),
                    const AutoSizeText('LEVEL TECHNIQUES'),
                    for (LevelTechnique levelTechnique
                        in temtemDetail.levelTechniques)
                      AutoSizeText(
                          '${levelTechnique.technique.name}: ${levelTechnique.level}'),
                    const AutoSizeText('COURSE TECHNIQUES'),
                    for (Technique courseTechnique
                        in temtemDetail.courseTechniques)
                      AutoSizeText(
                          '${courseTechnique.name}: ${courseTechnique.courseStatus}'),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        )));
  }
}
