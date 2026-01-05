import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/temtems/temtem.dart';
import 'package:games_app/temtem/temtems/temtem_request.dart';

import '../techniques/technique.dart';

class TemtemDetailScreen extends StatefulWidget {
  const TemtemDetailScreen({super.key, required this.temtem});

  final String temtem;

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
    _temtemDetail = temtemDetail(widget.temtem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text(widget.temtem)),
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
                    SwitchListTile(
                      title: const Text('Team Status'),
                      value: temtemDetail.teamStatus,
                      onChanged: (bool value) async {
                        updateTeamStatus(temtemDetail.name, value)
                            .then((response) => {
                                  setState(() {
                                    temtemDetail.teamStatus = value;
                                  })
                                });
                      },
                    ),
                    AutoSizeText('types: ${temtemDetail.types.toString()}'),
                    AutoSizeText(
                        'weakTypes: ${temtemDetail.weakTypes.toString()}'),
                    AutoSizeText(
                        'superWeakTypes: ${temtemDetail.superWeakTypes.toString()}'),
                    AutoSizeText(
                        'strongTypes: ${temtemDetail.strongTypes.toString()}'),
                    AutoSizeText(
                        'superStrongTypes: ${temtemDetail.superStrongTypes.toString()}'),
                    AutoSizeText('hitPoints: ${temtemDetail.hitPoints}'),
                    AutoSizeText('stamina: ${temtemDetail.stamina}'),
                    AutoSizeText('speed: ${temtemDetail.speed}'),
                    AutoSizeText('attack: ${temtemDetail.attack}'),
                    AutoSizeText('defense: ${temtemDetail.defense}'),
                    AutoSizeText(
                        'specialAttack: ${temtemDetail.specialAttack}'),
                    AutoSizeText(
                        'specialDefense: ${temtemDetail.specialDefense}'),
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
