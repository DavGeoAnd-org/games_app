import 'dart:convert';
import 'dart:io';

import 'package:games_app/mff/character/character.dart';
import 'package:http/http.dart' as http;

Future<List<Character>> allCharacters() async {
  final response = await http
      .get(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/mff/characters?app=true",
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

Future<String> updateCharacter(Character character) async {
  final response = await http
      .put(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/mff/characters",
    ),
    body: character.toJson(),
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
    throw Exception('Failed to update Character');
  }
}

Future<String> addCharacter(Character character) async {
  final response = await http
      .post(
    Uri.parse(
      "${const String.fromEnvironment('BASE_SERVICE_URL')}/mff/characters",
    ),
    body: character.toJson(),
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
    throw Exception('Failed to add Character');
  }
}
