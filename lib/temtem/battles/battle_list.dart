import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:games_app/temtem/temtems/temtem.dart';
import 'package:http/http.dart' as http;

import 'battle.dart';
import 'battle_detail.dart';

class BattleListScreen extends StatefulWidget {
  const BattleListScreen({super.key});

  @override
  State<BattleListScreen> createState() => _BattleListScreenState();
}

class _BattleListScreenState extends State<BattleListScreen> {
  Future<List<Battle>> battles = getBattles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Battle List")),
      body: FutureBuilder<List<Battle>>(
          future: battles,
          builder:
              (BuildContext context, AsyncSnapshot<List<Battle>> snapshot) {
            if (snapshot.hasData) {
              List<Battle> battleList = snapshot.data!;
              return ListView.builder(
                itemCount: battleList.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(battleList[index].name),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BattleDetailScreen(
                                  battle: battleList[index])));
                    },
                  ));
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  static Future<List<Battle>> getBattles() async {
    var url = Uri.parse(
        'http://homeproject-services-lb-1776073483.us-east-1.elb.amazonaws.com/games/temtem/battles');
    final response =
        await http.get(url).timeout(const Duration(seconds: 60), onTimeout: () {
      throw const HttpException("Service Not Running");
    });
    return (json.decode(response.body) as List)
        .map((data) => Battle.fromJson(data))
        .toList();
  }
}
