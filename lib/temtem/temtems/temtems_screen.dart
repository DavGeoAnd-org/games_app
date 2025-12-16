import 'package:flutter/material.dart';
import 'package:games_app/temtem/temtems/temtem.dart';
import 'package:games_app/temtem/temtems/temtem_detail_screen.dart';
import 'package:games_app/temtem/temtems/temtem_request.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../main.dart';

class TemtemsScreen extends StatefulWidget {
  const TemtemsScreen({super.key});

  @override
  State<TemtemsScreen> createState() => _TemtemsScreenState();
}

class _TemtemsScreenState extends State<TemtemsScreen> {
  Future<List<Temtem>> temtems = allTemtems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text("Temtems")),
        body: SafeArea(
          child: SearchableList<Temtem>.async(
            asyncListCallback: () async => temtems,
            asyncListFilter: (query, list) =>
                list.where((t) => t.name.toLowerCase().contains(query)).toList(),
            itemBuilder: (temtem) => Card(
                child: ListTile(
              title: Text(temtem.name),
              onTap: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (_) => TemtemDetailScreen(temtem: temtem),
                  ),
                );
              },
              trailing: Switch(
                value: temtem.teamStatus,
                onChanged: (bool value) async {
                  updateTeamStatus(temtem.name, value).then((response) => {
                        setState(() {
                          temtem.teamStatus = value;
                        })
                      });
                },
              ),
            )),
            loadingWidget: const Center(child: CircularProgressIndicator()),
            errorWidget: const Center(child: Icon(Icons.error)),
            searchFieldPadding: const EdgeInsets.all(20),
            listViewPadding: const EdgeInsets.all(20),
          ),
        ));
  }
}
