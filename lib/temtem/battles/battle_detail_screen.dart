import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/battles/teamSetup_screen.dart';

import '../../main.dart';
import 'battle.dart';
import 'battle_request.dart';

class BattleDetailScreen extends StatefulWidget {
  const BattleDetailScreen({super.key, required this.battle});

  final String battle;

  @override
  State<StatefulWidget> createState() {
    return _BattleDetailScreenState();
  }
}

class _BattleDetailScreenState extends State<BattleDetailScreen> {
  late Future<BattleDetail> _battleDetail;

  @override
  void initState() {
    super.initState();
    _battleDetail = battleDetail(widget.battle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(widget.battle),
          actions: [
            IconButton(
              icon: const Icon(Icons.view_list_outlined),
              onPressed: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (_) => TeamSetupScreen(battle: widget.battle),
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
            child: FutureBuilder<BattleDetail>(
          future: _battleDetail,
          builder:
              (BuildContext context, AsyncSnapshot<BattleDetail> snapshot) {
            if (snapshot.hasData) {
              BattleDetail battleDetail = snapshot.data!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const AutoSizeText('TEMTEMS'),
                    for (TemtemWithLevel temtem in battleDetail.levelTemtems)
                      AutoSizeText('${temtem.temtem.name}: ${temtem.level}'),
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
