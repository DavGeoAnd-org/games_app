import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../helper.dart';
import '../../main.dart';
import 'character.dart';
import 'character_request.dart';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({super.key, required this.character});

  final Character character;

  @override
  State<StatefulWidget> createState() {
    return _CharacterDetailScreenState();
  }
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  bool _editMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
      appBar: AppBar(
        title: AutoSizeText(
          RecordId.stringValueFromId(widget.character.id),
          maxLines: ScaffoldDefault.textMaxLines(),
        ),
        leading: BackButton(
          onPressed: () {
            navigatorKey.currentState?.pop(false);
          },
        ),
        actions: const [],
      ),
      body: _editMode ? editScreen() : detailScreen(),
    );
  }

  Widget detailScreen() {
    return SafeArea(
        minimum: SafeAreaDefault.minimum(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: ColumnDefault.crossAxisAlignment(),
            spacing: ColumnDefault.spacing(),
            children: [
              AutoSizeText('Name: ${widget.character.name}'),
              AutoSizeText('Type: ${widget.character.type}'),
              AutoSizeText('Gender: ${widget.character.gender}'),
              AutoSizeText('Side: ${widget.character.side}'),
              AutoSizeText(
                  'Tier: ${widget.character.tier.value} - ${widget.character.tier.level}'),
              AutoSizeText('6 Stars: ${widget.character.sixStar}'),
              if (widget.character.tier.value == "T1" &&
                  widget.character.sixStar)
                AutoSizeText(
                    'Specific Shadowland Level: ${widget.character.shadowland}'),
              AutoSizeText(
                  'Dispatch: ${widget.character.dispatch.sector}:${widget.character.dispatch.level}'),
              AutoSizeText('Silence: ${widget.character.silence}'),
              AutoSizeText('Burn: ${widget.character.burn}'),
              AutoSizeText('Paralyze: ${widget.character.paralyze}'),
              AutoSizeText('Infinite: ${widget.character.infinite}'),
              AutoSizeText('CTP: ${widget.character.ctp}'),
              AutoSizeText('CTP Status: ${widget.character.ctpStatus}'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _editMode = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: ElevatedButtonDefault.minimumSize(),
                  backgroundColor: ElevatedButtonDefault.backgroundColor(),
                ),
                child: AutoSizeText(
                  'Edit',
                  style: TextStyle(
                    fontSize: ElevatedButtonDefault.textFontSize(),
                    color: ElevatedButtonDefault.textColor(),
                  ),
                  maxLines: ElevatedButtonDefault.textMaxLines(),
                ),
              ),
            ],
          ),
        ));
  }

  late final TextEditingController _nameController =
      TextEditingController(text: widget.character.name);
  late final TextEditingController _typeController =
      TextEditingController(text: widget.character.type);
  late final TextEditingController _genderController =
      TextEditingController(text: widget.character.gender);
  late final TextEditingController _sideController =
      TextEditingController(text: widget.character.side);
  late final TextEditingController _tierValueController =
      TextEditingController(text: widget.character.tier.value);
  late final TextEditingController _tierLevelController =
      TextEditingController(text: widget.character.tier.level.toString());
  late final TextEditingController _sixStarsController =
      TextEditingController(text: widget.character.sixStar.toString());
  late final TextEditingController _shadowlandController =
      TextEditingController(text: widget.character.shadowland.toString());
  late final TextEditingController _dispatchSectorController =
      TextEditingController(text: widget.character.dispatch.sector.toString());
  late final TextEditingController _dispatchLevelController =
      TextEditingController(text: widget.character.dispatch.level.toString());
  late final TextEditingController _silenceController =
      TextEditingController(text: widget.character.silence.toString());
  late final TextEditingController _burnController =
      TextEditingController(text: widget.character.burn.toString());
  late final TextEditingController _paralyzeController =
      TextEditingController(text: widget.character.paralyze.toString());
  late final TextEditingController _infiniteController =
      TextEditingController(text: widget.character.infinite.toString());
  late final TextEditingController _ctpController =
      TextEditingController(text: widget.character.ctp);
  late final TextEditingController _ctpStatusController =
      TextEditingController(text: widget.character.ctpStatus);

  Widget editScreen() {
    return SafeArea(
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
              widget.character.name = _nameController.value.text;
              widget.character.type = _typeController.value.text;
              widget.character.gender = _genderController.value.text;
              widget.character.side = _sideController.value.text;
              widget.character.tier.value = _tierValueController.value.text;
              widget.character.tier.level =
                  int.parse(_tierLevelController.value.text);
              widget.character.sixStar =
                  bool.parse(_sixStarsController.value.text);
              widget.character.shadowland =
                  int.parse(_shadowlandController.value.text);
              widget.character.dispatch.sector =
                  int.parse(_dispatchSectorController.value.text);
              widget.character.dispatch.level =
                  int.parse(_dispatchLevelController.value.text);
              widget.character.silence =
                  int.parse(_silenceController.value.text);
              widget.character.burn = int.parse(_burnController.value.text);
              widget.character.paralyze =
                  int.parse(_paralyzeController.value.text);
              widget.character.infinite =
                  int.parse(_infiniteController.value.text);
              widget.character.ctp = _ctpController.value.text;
              widget.character.ctpStatus = _ctpStatusController.value.text;
              await updateCharacter(widget.character);
              navigatorKey.currentState?.pop(true);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: ElevatedButtonDefault.minimumSize(),
              backgroundColor: ElevatedButtonDefault.backgroundColor(),
            ),
            child: AutoSizeText(
              'Update',
              style: TextStyle(
                fontSize: ElevatedButtonDefault.textFontSize(),
                color: ElevatedButtonDefault.textColor(),
              ),
              maxLines: ElevatedButtonDefault.textMaxLines(),
            ),
          ),
        ],
      )),
    );
  }
}
