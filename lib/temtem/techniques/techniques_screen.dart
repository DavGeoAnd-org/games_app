import 'package:flutter/material.dart';
import 'package:games_app/temtem/techniques/technique.dart';
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
  Future<List<Technique>> techniques = allTechniques();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text("Techniques")),
        body: SafeArea(
          child: SearchableList<Technique>.async(
            asyncListCallback: () async => await allTechniques(),
            asyncListFilter: (query, list) =>
                list.where((t) => t.name.toLowerCase().contains(query)).toList(),
            itemBuilder: (technique) => Card(
                child: ListTile(
              title: Text(technique.name),
              onTap: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (_) => TechniqueDetailScreen(technique: technique),
                  ),
                );
              },
              trailing: (technique.courseId != null)
                  ? Switch(
                      value: technique.courseStatus!,
                      onChanged: (bool value) async {
                        updateCourseStatus(technique.name, value)
                            .then((response) => {
                                  setState(() {
                                    technique.courseStatus = value;
                                  })
                                });
                      },
                    )
                  : null,
            )),
            loadingWidget: const Center(child: CircularProgressIndicator()),
            errorWidget: const Center(child: Icon(Icons.error)),
            searchFieldPadding: const EdgeInsets.all(20),
            listViewPadding: const EdgeInsets.all(20),
          ),
        ));
  }
}
