import 'dart:convert';
import 'dart:io';

import 'package:games_app/temtem/techniques/technique.dart';
import 'package:http/http.dart' as http;

Future<List<Technique>> allTechniques() async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/techniques",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    List<Technique> temtemList = (json.decode(response.body) as List)
        .map((data) => Technique.fromMap(data))
        .toList();
    return temtemList;
  } else {
    throw Exception('Failed to load Technique list');
  }
}

Future<List<String>> allTechniqueIds() async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/techniques?idOnly=true",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    List<String> techniqueList = List.from(json.decode(response.body));
    return techniqueList;
  } else {
    throw Exception('Failed to load Technique list');
  }
}

Future<Technique> technique(String id) async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/techniques/$id",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    return Technique.fromJson(response.body);
  } else {
    throw Exception('Failed to load Technique');
  }
}

Future<String> updateCourseStatus(String id, bool courseStatus) async {
  final response = await http
      .put(
          Uri.parse(
            "${const String.fromEnvironment('BASE_SERVICE_URL')}/temtem/techniques/$id/courseStatus",
          ),
          body: jsonEncode(courseStatus))
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to update course status');
  }
}
