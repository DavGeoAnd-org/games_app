import 'dart:convert';
import 'dart:io';

import 'package:games_app/temtem/temtems/temtem.dart';
import 'package:http/http.dart' as http;

Future<List<Temtem>> allTemtems() async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/temtems",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    List<Temtem> temtemList = (json.decode(response.body) as List)
        .map((data) => Temtem.fromMap(data))
        .toList();
    return temtemList;
  } else {
    throw Exception('Failed to load Temtem list');
  }
}

Future<List<String>> allTemtemIds() async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/temtems?idOnly=true",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    List<String> temtemList = List.from(json.decode(response.body));
    return temtemList;
  } else {
    throw Exception('Failed to load Temtem list');
  }
}

Future<Temtem> temtem(String id) async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/temtems/$id",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    return Temtem.fromJson(response.body);
  } else {
    throw Exception('Failed to load Temtem');
  }
}

Future<TemtemDetail> temtemDetail(String id) async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/temtems/$id?detail=true",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    return TemtemDetail.fromJson(response.body);
  } else {
    throw Exception('Failed to load TemtemDetail');
  }
}

Future<String> updateTeamStatus(String id, bool teamStatus) async {
  final response = await http
      .put(
          Uri.parse(
            "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/temtems/$id/teamStatus",
          ),
          body: jsonEncode(teamStatus))
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to update team status');
  }
}
