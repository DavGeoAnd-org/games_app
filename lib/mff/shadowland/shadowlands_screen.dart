import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/mff/shadowland/shadowland.dart';
import 'package:games_app/mff/shadowland/shadowland_detail.dart';
import 'package:games_app/mff/shadowland/shadowland_request.dart';

import '../../helper.dart';
import '../../main.dart';

class ShadowlandsScreen extends StatefulWidget {
  const ShadowlandsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShadowlandsScreenState();
  }
}

class _ShadowlandsScreenState extends State<ShadowlandsScreen> {
  bool isLoading = true;
  late List<Shadowland> _shadowlands;
  Exception? _exception;
  StackTrace? _stackTrace;
  int _listViewBuilderKey = 1;

  @override
  void initState() {
    super.initState();
    allShadowlands().then((value) {
      _shadowlands = value;
      _shadowlands.sort((a, b) => RecordId.intValueFromId(b.id)
          .compareTo(RecordId.intValueFromId(a.id)));
    }).onError<Exception>((exception, stacktrace) {
      _exception = exception;
      _stackTrace = stacktrace;
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_exception != null) {
      return Center(
        child: AutoSizeText('$_exception'),
      );
    } else {
      return Scaffold(
          resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
          appBar: AppBar(
            title: AutoSizeText(
              'Shadowlands',
              maxLines: ScaffoldDefault.textMaxLines(),
            ),
            // leading: BackButton(onPressed: () {}),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  addShadowland().whenComplete(() {
                    allShadowlands().then((value) {
                      _shadowlands = value;
                      _shadowlands.sort((a, b) => RecordId.intValueFromId(b.id)
                          .compareTo(RecordId.intValueFromId(a.id)));
                    }).whenComplete(() {
                      setState(() {
                        _listViewBuilderKey *= -1;
                      });
                    });
                  });
                },
              ),
            ],
          ),
          body: SafeArea(
            minimum: SafeAreaDefault.minimum(),
            child: ListView.builder(
                key: ValueKey(_listViewBuilderKey),
                itemCount: _shadowlands.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: AutoSizeText(
                        '${DateTime.fromMillisecondsSinceEpoch(RecordId.intValueFromId(_shadowlands[index].id), isUtc: false)}',
                        maxLines: SearchableListDefault.textMaxLines(),
                      ),
                      onTap: () async {
                        final bool? result =
                            await navigatorKey.currentState?.push(
                          MaterialPageRoute(
                              builder: (_) => ShadowlandDetailScreen(
                                  shadowland: _shadowlands[index])),
                        );
                        if (result != null && result) {
                          setState(() {
                            _listViewBuilderKey *= -1;
                          });
                        }
                      },
                    ),
                  );
                }),
          ));
    }
  }
}
