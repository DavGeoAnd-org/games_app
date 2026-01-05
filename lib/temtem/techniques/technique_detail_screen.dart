import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/temtem/techniques/technique.dart';
import 'package:games_app/temtem/techniques/technique_request.dart';

class TechniqueDetailScreen extends StatefulWidget {
  const TechniqueDetailScreen({super.key, required this.technique});

  final String technique;

  @override
  State<StatefulWidget> createState() {
    return _TechniqueDetailScreenState();
  }
}

class _TechniqueDetailScreenState extends State<TechniqueDetailScreen> {
  late Future<Technique> _technique;

  @override
  void initState() {
    super.initState();
    _technique = technique(widget.technique);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text(widget.technique)),
        body: SafeArea(
            child: FutureBuilder<Technique>(
          future: _technique,
          builder: (BuildContext context, AsyncSnapshot<Technique> snapshot) {
            if (snapshot.hasData) {
              Technique technique = snapshot.data!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (technique.courseId != null)
                      SwitchListTile(
                        title: Text('${technique.courseId}'),
                        value: technique.courseStatus!,
                        onChanged: (bool value) async {
                          updateCourseStatus(technique.name, value)
                              .then((response) => {
                                    setState(() {
                                      technique.courseStatus = value;
                                    })
                                  });
                        },
                      ),
                    AutoSizeText('type: ${technique.type}'),
                    AutoSizeText('synergy: ${technique.synergy}'),
                    AutoSizeText('category: ${technique.category}'),
                    AutoSizeText('targeting: ${technique.targeting}'),
                    AutoSizeText('damage: ${technique.damage}'),
                    AutoSizeText('staminaCost: ${technique.staminaCost}'),
                    AutoSizeText('hold: ${technique.hold}'),
                    AutoSizeText('priority: ${technique.priority}'),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        )));
  }
}
