import 'dart:convert';
import 'dart:io';

import 'package:games_app/mff/shadowland/shadowland.dart';
import 'package:http/http.dart' as http;

import '../character/character.dart';

Future<List<Shadowland>> allShadowlands() async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/mff/shadowlands",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    List<Shadowland> shadowlandList = (json.decode(response.body) as List)
        .map((data) => ShadowlandMapper.fromMap(data))
        .toList();
    return shadowlandList;
  } else {
    throw Exception('Failed to load Shadowland list');
  }
}

Future<String> addShadowland() async {
  final response = await http
      .post(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/mff/shadowlands",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 201) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to add Shadowland');
  }
}

Future<List<Character>> allCharactersForShadowland() async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/mff/shadowlands/characters",
    ),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Timeout");
    },
  ).onError<Exception>((e, s) {
    throw const HttpException("Service Not Running");
  });

  if (response.statusCode == 200) {
    List<Character> characterList = (json.decode(response.body) as List)
        .map((data) => CharacterMapper.fromMap(data))
        .toList();
    return characterList;
  } else {
    throw Exception('Failed to load Character list');
  }
}

Future<String> updateShadowland(Shadowland shadowland) async {
  final response = await http
      .put(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/mff/shadowlands",
    ),
    body: shadowland.toJson(),
  )
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      throw const HttpException("Service Not Running");
    },
  );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as Map<String, dynamic>)['message'];
  } else {
    throw Exception('Failed to update Shadowland');
  }
}
