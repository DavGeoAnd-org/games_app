import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/mff/character/characters_screen.dart';
import 'package:games_app/mff/shadowland/shadowlands_screen.dart';

import '../helper.dart';
import '../main.dart';

class MffHomeScreen extends StatelessWidget {
  const MffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText(
          'Marvel Future Fight',
          maxLines: ElevatedButtonDefault.textMaxLines(),
        ),
        // leading: BackButton(onPressed: () {}),
        actions: const [],
      ),
      body: SafeArea(
        minimum: SafeAreaDefault.minimum(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
            spacing: ColumnDefault.spacing(),
            children: [
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(builder: (_) => const CharactersScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: ElevatedButtonDefault.minimumSize(),
                  backgroundColor: ElevatedButtonDefault.backgroundColor(),
                ),
                child: AutoSizeText(
                  'Characters',
                  style: TextStyle(
                    fontSize: ElevatedButtonDefault.textFontSize(),
                    color: ElevatedButtonDefault.textColor(),
                  ),
                  maxLines: ElevatedButtonDefault.textMaxLines(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState?.push(
                    MaterialPageRoute(
                        builder: (_) => const ShadowlandsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: ElevatedButtonDefault.minimumSize(),
                  backgroundColor: ElevatedButtonDefault.backgroundColor(),
                ),
                child: AutoSizeText(
                  'Shadowlands',
                  style: TextStyle(
                    fontSize: ElevatedButtonDefault.textFontSize(),
                    color: ElevatedButtonDefault.textColor(),
                  ),
                  maxLines: ElevatedButtonDefault.textMaxLines(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
