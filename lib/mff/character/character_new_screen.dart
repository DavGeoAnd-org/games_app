import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/mff/character/character_request.dart';

import '../../helper.dart';
import '../../main.dart';
import 'character.dart';

class CharacterNewScreen extends StatelessWidget {
  CharacterNewScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _sideController = TextEditingController();
  final TextEditingController _tierValueController =
      TextEditingController(text: 'T1');
  final TextEditingController _tierLevelController =
      TextEditingController(text: '0');
  final TextEditingController _sixStarsController = TextEditingController(text: 'false');
  final TextEditingController _shadowlandController = TextEditingController(text: '0');
  final TextEditingController _dispatchSectorController =
      TextEditingController(text: '1');
  final TextEditingController _dispatchLevelController =
      TextEditingController(text: '1');
  final TextEditingController _silenceController = TextEditingController(text: '0');
  final TextEditingController _burnController = TextEditingController(text: '0');
  final TextEditingController _paralyzeController = TextEditingController(text: '0');
  final TextEditingController _infiniteController = TextEditingController(text: '0');
  final TextEditingController _ctpController = TextEditingController();
  final TextEditingController _ctpStatusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText(
          'New Character',
          maxLines: ScaffoldDefault.textMaxLines(),
        ),
        leading: BackButton(onPressed: () {
          navigatorKey.currentState?.pop(false);
        }),
        actions: const [],
      ),
      body: SafeArea(
        minimum: SafeAreaDefault.minimum(),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
          spacing: ColumnDefault.spacing(),
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              controller: _nameController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type',
              ),
              controller: _typeController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Gender',
              ),
              controller: _genderController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Side',
              ),
              controller: _sideController,
            ),
            Row(
                spacing: RowDefault.spacing(),
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tier Value',
                      ),
                      controller: _tierValueController,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tier Level',
                      ),
                      controller: _tierLevelController,
                    ),
                  )
                ]),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '6 Stars',
              ),
              controller: _sixStarsController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Shadowland Level',
              ),
              controller: _shadowlandController,
            ),
            Row(
                spacing: RowDefault.spacing(),
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Dispatch Sector',
                      ),
                      controller: _dispatchSectorController,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Dispatch Level',
                      ),
                      controller: _dispatchLevelController,
                    ),
                  )
                ]),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Silence',
              ),
              controller: _silenceController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Burn',
              ),
              controller: _burnController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Paralyze',
              ),
              controller: _paralyzeController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Infinite',
              ),
              controller: _infiniteController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CTP',
              ),
              controller: _ctpController,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CTP Status',
              ),
              controller: _ctpStatusController,
            ),
            ElevatedButton(
              onPressed: () async {
                Character character = Character(
                    id: '',
                    name: _nameController.value.text,
                    type: _typeController.value.text,
                    gender: _genderController.value.text,
                    side: _sideController.value.text,
                    tier: Tier(
                        value: _tierValueController.value.text,
                        level: int.parse(_tierLevelController.value.text)),
                    sixStar: bool.parse(_sixStarsController.value.text),
                    shadowland: int.parse(_shadowlandController.value.text),
                    dispatch: Dispatch(
                        sector: int.parse(_dispatchSectorController.value.text),
                        level: int.parse(_dispatchLevelController.value.text)),
                    silence: int.parse(_silenceController.value.text),
                    burn: int.parse(_burnController.value.text),
                    paralyze: int.parse(_paralyzeController.value.text),
                    infinite: int.parse(_infiniteController.value.text),
                    ctp: _ctpController.value.text,
                    ctpStatus: _ctpStatusController.value.text,
                    update: false);
                await addCharacter(character);
                navigatorKey.currentState?.pop(true);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: ElevatedButtonDefault.minimumSize(),
                backgroundColor: ElevatedButtonDefault.backgroundColor(),
              ),
              child: AutoSizeText(
                'Add',
                style: TextStyle(
                  fontSize: ElevatedButtonDefault.textFontSize(),
                  color: ElevatedButtonDefault.textColor(),
                ),
                maxLines: ElevatedButtonDefault.textMaxLines(),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
