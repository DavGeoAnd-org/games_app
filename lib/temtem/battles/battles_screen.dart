import 'package:flutter/material.dart';
import 'package:games_app/temtem/battles/battle.dart';
import 'package:games_app/temtem/battles/battle_request.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../main.dart';
import 'battle_detail_screen.dart';

class BattlesScreen extends StatefulWidget {
  const BattlesScreen({super.key});

  @override
  State<BattlesScreen> createState() => _BattlesScreenState();
}

class _BattlesScreenState extends State<BattlesScreen> {
  Future<List<String>> battles = allBattleIds();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text("Battles")),
        body: SafeArea(
          child: SearchableList<String>.async(
            asyncListCallback: () async => battles,
            asyncListFilter: (query, list) => list
                .where((b) => b.toLowerCase().contains(query))
                .toList(),
            itemBuilder: (battleId) => Card(
                child: ListTile(
              title: Text(battleId),
              onTap: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (_) => BattleDetailScreen(battle: battleId),
                  ),
                );
              },
            )),
            loadingWidget: const Center(child: CircularProgressIndicator()),
            errorWidget: const Center(child: Icon(Icons.error)),
            searchFieldPadding: const EdgeInsets.all(20),
            listViewPadding: const EdgeInsets.all(20),
          ),
        ));
  }
}
