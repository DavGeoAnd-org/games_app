import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:games_app/temtem/techniques/technique.dart';
import 'package:games_app/temtem/techniques/technique_detail.dart';
import 'package:http/http.dart' as http;

class TechniqueListScreen extends StatefulWidget {
  const TechniqueListScreen({super.key});

  @override
  State<TechniqueListScreen> createState() => _TechniqueListScreenState();
}

class _TechniqueListScreenState extends State<TechniqueListScreen> {
  Future<List<Technique>> techniques = getTechniques();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Technique List")),
      body: FutureBuilder<List<Technique>>(
          future: techniques,
          builder:
              (BuildContext context, AsyncSnapshot<List<Technique>> snapshot) {
            if (snapshot.hasData) {
              List<Technique> techniqueList = snapshot.data!;
              return ListView.builder(
                itemCount: techniqueList.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(techniqueList[index].name),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TechniqueDetailScreen(
                                  technique: techniqueList[index])));
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

  static Future<List<Technique>> getTechniques() async {
    var url = Uri.parse(
        'http://homeproject-services-lb-1776073483.us-east-1.elb.amazonaws.com/games/temtem/techniques');
    final response =
        await http.get(url).timeout(const Duration(seconds: 60), onTimeout: () {
      throw const HttpException("Service Not Running");
    });
    return (json.decode(response.body) as List)
        .map((data) => Technique.fromJson(data))
        .toList();
  }
}
