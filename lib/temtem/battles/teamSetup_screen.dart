import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/battles/battle.dart';
import 'package:games_app/temtem/battles/battle_request.dart';
import 'package:games_app/temtem/temtems/temtem.dart';
import 'package:searchable_listview/searchable_listview.dart';

class TeamSetupScreen extends StatefulWidget {
  const TeamSetupScreen({super.key, required this.battle});

  final String battle;

  @override
  State<StatefulWidget> createState() {
    return _TeamSetupScreenState();
  }
}

class _TeamSetupScreenState extends State<TeamSetupScreen> {
  late Future<TeamSetup> _teamSetup;

  @override
  void initState() {
    super.initState();
    _teamSetup = teamSetup(widget.battle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(widget.battle),
        ),
        body: FutureBuilder<TeamSetup>(
          future: _teamSetup,
          builder: (BuildContext context, AsyncSnapshot<TeamSetup> snapshot) {
            if (snapshot.hasData) {
              TeamSetup teamSetup = snapshot.data!;
              List<TeamTemtemDetail> teamTemtemDetailList =
                  List.empty(growable: true);
              teamSetup.teamTemtemScore.forEach((teamTemtem, teamScore) {
                List<String> teamTemtemTypes =
                    teamSetup.teamTemtemTypes[teamTemtem]!;
                teamTemtemDetailList.add(TeamTemtemDetail(
                    temtem: teamTemtem,
                    score: teamScore,
                    types: teamTemtemTypes));
              });
              teamTemtemDetailList.sort((a, b) => b.score.compareTo(a.score));
              return SafeArea(
                  minimum: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      AutoSizeText(
                          'Avg Level: ${teamSetup.avgLevel} Highest Level: ${teamSetup.highestLevel}'),
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: AutoSizeText(
                                      'Type Score:${battleTemtemScoreString(teamSetup.battleTemtemTypeScore)}')),
                              Expanded(
                                flex: 5,
                                child: SearchableList<TeamTemtemDetail>(
                                  initialList: teamTemtemDetailList,
                                  itemBuilder: (teamTemtem) => AutoSizeText(
                                      '${teamTemtem.temtem}: ${teamTemtem.score} - ${teamTemtem.types.toString()}'),
                                  filter: (query) => teamTemtemDetailList
                                      .where((teamTemtem) => teamTemtem.temtem
                                          .toLowerCase()
                                          .contains(query.toLowerCase()))
                                      .toList(),
                                  emptyWidget:
                                      const Center(child: Text('No results')),
                                  inputDecoration: const InputDecoration(
                                      labelText: 'Search team temtem'),
                                ),
                              )
                            ],
                          )),
                      Expanded(
                        flex: 1,
                        child: SearchableList<LevelTemtem>(
                          initialList: teamSetup.battleTemtems,
                          itemBuilder: (temtem) => AutoSizeText(
                              '${temtem.temtem.name}: Weak - ${temtem.temtem.weakTypes}, SuperWeak - ${temtem.temtem.superWeakTypes}'),
                          filter: (query) => teamSetup.battleTemtems
                              .where((temtem) => temtem.temtem.name
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList(),
                          emptyWidget: const Center(child: Text('No results')),
                          inputDecoration: const InputDecoration(
                              labelText: 'Search battle temtem'),
                        ),
                      )
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  String battleTemtemScoreString(Map<String, int> battleTemtemTypeScore) {
    String result = '';
    Map<String, int> sortedMap = Map.fromEntries(
        battleTemtemTypeScore.entries.toList()
          ..sort((e1, e2) => e2.value.compareTo(e1.value)));
    for (MapEntry<String, int> entry in sortedMap.entries) {
      result += '\n${entry.key}: ${entry.value}';
    }
    return result;
  }
}

class TeamTemtemDetail {
  String temtem;
  int score;
  List<String> types;

  TeamTemtemDetail(
      {required this.temtem, required this.score, required this.types});
}
