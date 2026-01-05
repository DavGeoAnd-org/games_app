import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'battle.dart';

Future<List<Battle>> allBattles() async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/battles",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    List<Battle> battleList = (json.decode(response.body) as List)
        .map((data) => Battle.fromMap(data))
        .toList();
    return battleList;
  } else {
    throw Exception('Failed to load Battle list');
  }
}

Future<List<String>> allBattleIds() async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/battles?idOnly=true",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    List<String> battleList = List.from(json.decode(response.body));
    return battleList;
  } else {
    throw Exception('Failed to load Battle list');
  }
}

Future<BattleDetail> battleDetail(String id) async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/battles/$id?detail=true",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    return BattleDetail.fromJson(response.body);
  } else {
    throw Exception('Failed to load BattleDetail');
  }
}

Future<TeamSetup> teamSetup(String id) async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/battles/$id/teamSetup",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    return TeamSetup.fromJson(response.body);
  } else {
    throw Exception('Failed to load TeamSetup');
  }
}
