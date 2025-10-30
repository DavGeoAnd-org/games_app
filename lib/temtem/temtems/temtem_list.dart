import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:games_app/temtem/temtems/temtem.dart';
import 'package:games_app/temtem/temtems/temtem_detail.dart';
import 'package:http/http.dart' as http;

class TemtemListScreen extends StatefulWidget {
  const TemtemListScreen({super.key});

  @override
  State<TemtemListScreen> createState() => _TemtemListScreenState();
}

class _TemtemListScreenState extends State<TemtemListScreen> {
  Future<List<Temtem>> temtems = getTemtems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Temtem List")),
      body: FutureBuilder<List<Temtem>>(
          future: temtems,
          builder:
              (BuildContext context, AsyncSnapshot<List<Temtem>> snapshot) {
            if (snapshot.hasData) {
              List<Temtem> temtemList = snapshot.data!;
              return ListView.builder(
                itemCount: temtemList.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(temtemList[index].name),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TemtemDetailScreen(
                                  temtem: temtemList[index])));
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

  static Future<List<Temtem>> getTemtems() async {
    var url = Uri.parse(
        'http://homeproject-services-lb-1776073483.us-east-1.elb.amazonaws.com/games/temtem/temtems');
    final response =
        await http.get(url).timeout(const Duration(seconds: 60), onTimeout: () {
      throw const HttpException("Service Not Running");
    });
    return (json.decode(response.body) as List)
        .map((data) => Temtem.fromJson(data))
        .toList();
  }
}
