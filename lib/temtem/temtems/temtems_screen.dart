import 'package:flutter/material.dart';
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
  Future<List<String>> temtemIds = allTemtemIds();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text("Temtems")),
        body: SafeArea(
          child: SearchableList<String>.async(
            asyncListCallback: () async => temtemIds,
            asyncListFilter: (query, list) =>
                list.where((t) => t.toLowerCase().contains(query)).toList(),
            itemBuilder: (temtemId) => Card(
                child: ListTile(
              title: Text(temtemId),
              onTap: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (_) => TemtemDetailScreen(temtem: temtemId),
                  ),
                );
              },
            )),
            loadingWidget: const Center(child: CircularProgressIndicator()),
            errorWidget: const Center(child: Icon(Icons.error)),
            searchFieldPadding: const EdgeInsets.all(20),
            listViewPadding: const EdgeInsets.all(20),
          ),
        ));
  }
}
