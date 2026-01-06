import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/battles/battle.dart';
import 'package:games_app/temtem/battles/battle_request.dart';
import 'package:games_app/temtem/temtems/temtem_detail_screen.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../main.dart';

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
              List<BattleTemtem> battleTemtemList =
                  teamSetup.battleTemtems.values.toList();
              teamSetup.teamTemtems.sort((a, b) => b.score.compareTo(a.score));
              return SafeArea(
                  minimum: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      AutoSizeText('Team Level: ${teamSetup.teamTemtemLevel}'),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 5,
                            children: [
                              Expanded(
                                flex: 1,
                                child: SearchableList<TeamTemtemWithScore>(
                                  initialList: teamSetup.teamTemtems,
                                  itemBuilder: (teamTemtem) => Card(
                                      child: ListTile(
                                    title: AutoSizeText(
                                        '${teamTemtem.temtem.name}: ${teamTemtem.score}'),
                                    onTap: () {
                                      navigatorKey.currentState?.push(
                                        MaterialPageRoute(
                                          builder: (_) => TemtemDetailScreen(
                                              temtem: teamTemtem.temtem.name),
                                        ),
                                      );
                                    },
                                  )),
                                  filter: (query) => teamSetup.teamTemtems
                                      .where((teamTemtem) => teamTemtem
                                          .temtem.name
                                          .toLowerCase()
                                          .contains(query.toLowerCase()))
                                      .toList(),
                                  emptyWidget:
                                      const Center(child: Text('No results')),
                                  inputDecoration: const InputDecoration(
                                      labelText: 'Search team temtem'),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: SearchableList<BattleTemtem>(
                                  initialList: battleTemtemList,
                                  itemBuilder: (battleTemtem) => Card(
                                      child: ListTile(
                                    title: AutoSizeText(
                                        '${battleTemtem.temtem.name}: Weak - ${battleTemtem.temtem.weakTypes}, SuperWeak - ${battleTemtem.temtem.superWeakTypes}, Team Temtems - ${battleTemtem.teamTemtems}'),
                                    onTap: () {
                                      navigatorKey.currentState?.push(
                                        MaterialPageRoute(
                                          builder: (_) => TemtemDetailScreen(
                                              temtem: battleTemtem.temtem.name),
                                        ),
                                      );
                                    },
                                  )),
                                  filter: (query) => battleTemtemList
                                      .where((battleTemtem) => battleTemtem
                                          .temtem.name
                                          .toLowerCase()
                                          .contains(query.toLowerCase()))
                                      .toList(),
                                  emptyWidget:
                                      const Center(child: Text('No results')),
                                  inputDecoration: const InputDecoration(
                                      labelText: 'Search battle temtem'),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
