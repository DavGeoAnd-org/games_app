import 'package:flutter/material.dart';
import 'package:games_app/temtem/techniques/technique_detail_screen.dart';
import 'package:games_app/temtem/techniques/technique_request.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../main.dart';

class TechniquesScreen extends StatefulWidget {
  const TechniquesScreen({super.key});

  @override
  State<TechniquesScreen> createState() => _TechniquesScreenState();
}

class _TechniquesScreenState extends State<TechniquesScreen> {
  Future<List<String>> techniqueIds = allTechniqueIds();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text("Techniques")),
        body: SafeArea(
          child: SearchableList<String>.async(
            asyncListCallback: () async => techniqueIds,
            asyncListFilter: (query, list) =>
                list.where((t) => t.toLowerCase().contains(query)).toList(),
            itemBuilder: (techniqueId) => Card(
                child: ListTile(
              title: Text(techniqueId),
              onTap: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (_) =>
                        TechniqueDetailScreen(technique: techniqueId),
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
