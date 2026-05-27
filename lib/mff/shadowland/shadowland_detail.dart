import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/mff/shadowland/shadowland.dart';
import 'package:games_app/mff/shadowland/shadowland_request.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../helper.dart';
import '../../main.dart';
import '../character/character.dart';
import '../character/character_detail_screen.dart';

class ShadowlandDetailScreen extends StatefulWidget {
  const ShadowlandDetailScreen({super.key, required this.shadowland});

  final Shadowland shadowland;

  @override
  State<StatefulWidget> createState() {
    return _ShadowlandDetailScreenState();
  }
}

class _ShadowlandDetailScreenState extends State<ShadowlandDetailScreen> {
  bool isLoading = true;
  late List<Character> _characters;
  Exception? _exception;
  StackTrace? _stackTrace;
  late List<Character> _filterCharacters;
  final MultiSelectController<String> _typeController = MultiSelectController();
  final MultiSelectController<String> _genderController =
      MultiSelectController();
  final MultiSelectController<String> _sideController = MultiSelectController();
  int _searchableListKey = 1;
  final TextEditingController _searchController = TextEditingController();
  List<String> selectedCharacters = List.empty(growable: true);
  int _listTileKey = 1;
  final MultiSelectController<String> _tierController = MultiSelectController();

  @override
  void initState() {
    super.initState();
    allCharactersForShadowland().then((value) {
      _characters = value;
      filterCharacterList();
    }).onError<Exception>((exception, stacktrace) {
      _exception = exception;
      _stackTrace = stacktrace;
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  void filterCharacterList() {
    _characters.removeWhere(
        (character) => widget.shadowland.charactersUsed.contains(character.id));
    _filterCharacters = List.from(_characters);
    if (_tierController.selectedItems.isNotEmpty) {
      _filterCharacters.removeWhere((character) {
        List<String> selectedTiers = List.empty(growable: true);
        for (var dropdownItem in _tierController.selectedItems) {
          selectedTiers.add(dropdownItem.value);
        }
        return !selectedTiers.contains(character.tier.value.toUpperCase());
      });
    }
    if (_typeController.selectedItems.isNotEmpty) {
      _filterCharacters.removeWhere((character) {
        List<String> selectedTypes = List.empty(growable: true);
        for (var dropdownItem in _typeController.selectedItems) {
          selectedTypes.add(dropdownItem.value);
        }
        return !selectedTypes.contains(character.type.toUpperCase());
      });
    }
    if (_genderController.selectedItems.isNotEmpty) {
      _filterCharacters.removeWhere((character) =>
          _genderController.selectedItems.first.value !=
          character.gender.toUpperCase());
    }
    if (_sideController.selectedItems.isNotEmpty) {
      _filterCharacters.removeWhere((character) =>
          _sideController.selectedItems.first.value !=
          character.side.toUpperCase());
    }
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
            '${DateTime.fromMillisecondsSinceEpoch(RecordId.intValueFromId(widget.shadowland.id), isUtc: false)}',
            maxLines: ScaffoldDefault.textMaxLines(),
          ),
          leading: BackButton(
            onPressed: () {
              navigatorKey.currentState?.pop(false);
            },
          ),
          actions: const [],
        ),
        body: SafeArea(
            minimum: SafeAreaDefault.minimum(),
            child: Row(
              spacing: 10,
              children: [
                Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          MultiDropdown<String>(
                            items: [
                              DropdownItem(label: 'T1', value: 'T1'),
                              DropdownItem(label: 'T2', value: 'T2'),
                              DropdownItem(label: 'T3', value: 'T3'),
                              DropdownItem(label: 'TP', value: 'TP'),
                              DropdownItem(label: 'T4', value: 'T4'),
                            ],
                            onSelectionChange: (selectedItems) {
                              filterCharacterList();
                              setState(() {
                                _searchableListKey *= -1;
                              });
                            },
                            controller: _tierController,
                            fieldDecoration:
                                const FieldDecoration(hintText: 'Tier'),
                          ),
                          MultiDropdown<String>(
                            items: [
                              DropdownItem(label: 'BLAST', value: 'BLAST'),
                              DropdownItem(label: 'COMBAT', value: 'COMBAT'),
                              DropdownItem(label: 'SPEED', value: 'SPEED'),
                              DropdownItem(
                                  label: 'UNIVERSAL', value: 'UNIVERSAL'),
                            ],
                            onSelectionChange: (selectedItems) {
                              filterCharacterList();
                              setState(() {
                                _searchableListKey *= -1;
                              });
                            },
                            controller: _typeController,
                            fieldDecoration:
                                const FieldDecoration(hintText: 'Type'),
                          ),
                          MultiDropdown<String>(
                            items: [
                              DropdownItem(label: 'MALE', value: 'MALE'),
                              DropdownItem(label: 'FEMALE', value: 'FEMALE'),
                              DropdownItem(label: 'NEUTRAL', value: 'NEUTRAL'),
                            ],
                            onSelectionChange: (selectedItems) {
                              filterCharacterList();
                              setState(() {
                                _searchableListKey *= -1;
                              });
                            },
                            controller: _genderController,
                            fieldDecoration:
                                const FieldDecoration(hintText: 'Gender'),
                            singleSelect: true,
                          ),
                          MultiDropdown<String>(
                            items: [
                              DropdownItem(label: 'HERO', value: 'HERO'),
                              DropdownItem(label: 'VILLAIN', value: 'VILLAIN'),
                            ],
                            onSelectionChange: (selectedItems) {
                              filterCharacterList();
                              setState(() {
                                _searchableListKey *= -1;
                              });
                            },
                            controller: _sideController,
                            fieldDecoration:
                                const FieldDecoration(hintText: 'Side'),
                            singleSelect: true,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              widget.shadowland.charactersUsed
                                  .addAll(selectedCharacters);
                              widget.shadowland.currentLevel += 1;
                              updateShadowland(widget.shadowland)
                                  .whenComplete(() {
                                filterCharacterList();
                                selectedCharacters.clear();
                                setState(() {
                                  _searchableListKey *= -1;
                                });
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: ElevatedButtonDefault.minimumSize(),
                              backgroundColor:
                                  ElevatedButtonDefault.backgroundColor(),
                            ),
                            child: AutoSizeText(
                              'Next Level',
                              style: TextStyle(
                                fontSize: ElevatedButtonDefault.textFontSize(),
                                color: ElevatedButtonDefault.textColor(),
                              ),
                              maxLines: ElevatedButtonDefault.textMaxLines(),
                            ),
                          ),
                          AutoSizeText(
                              'Current: ${widget.shadowland.currentLevel}'),
                          AutoSizeText(
                              'Expected: ${widget.shadowland.currentLevel + ((widget.shadowland.charactersUsed.length + _characters.length) - widget.shadowland.charactersUsed.length)}'),
                          AutoSizeText(
                              'BLAST - ${_filterCharacters.where((char) => char.type.toUpperCase() == 'BLAST').length}'),
                          AutoSizeText(
                              'COMBAT - ${_filterCharacters.where((char) => char.type.toUpperCase() == 'COMBAT').length}'),
                          AutoSizeText(
                              'SPEED - ${_filterCharacters.where((char) => char.type.toUpperCase() == 'SPEED').length}'),
                          AutoSizeText(
                              'UNIVERSAL - ${_filterCharacters.where((char) => char.type.toUpperCase() == 'UNIVERSAL').length}'),
                          for (Character char in _filterCharacters)
                            if (char.shadowland ==
                                widget.shadowland.currentLevel)
                              AutoSizeText(
                                  'T1 - ${RecordId.stringValueFromId(char.id)}')
                        ],
                      ),
                    )),
                Expanded(
                  flex: 7,
                  child: SearchableList<Character>(
                    key: ValueKey(_searchableListKey),
                    searchTextController: _searchController,
                    initialList: _filterCharacters,
                    filter: (query) {
                      return _filterCharacters
                          .where((character) =>
                              RecordId.stringValueFromId(character.id)
                                  .contains(query.toUpperCase()) ||
                              character.name.contains(query.toUpperCase()))
                          .toList();
                    },
                    itemBuilder: (character) => Card(
                      child: ListTile(
                        key: ValueKey(_listTileKey),
                        title: AutoSizeText(
                          RecordId.stringValueFromId(character.id) ==
                                  character.name
                              ? RecordId.stringValueFromId(character.id)
                              : '${RecordId.stringValueFromId(character.id)} {${character.name}}',
                          maxLines: SearchableListDefault.textMaxLines(),
                        ),
                        subtitle: AutoSizeText(
                            '${character.type} - ${character.gender} - ${character.side}',
                            maxLines: SearchableListDefault.textMaxLines()),
                        onTap: () async {
                          final bool? result =
                              await navigatorKey.currentState?.push(
                            MaterialPageRoute(
                              builder: (_) => CharacterDetailScreen(
                                character: character,
                              ),
                            ),
                          );
                          if (result != null && result) {
                            setState(() {
                              _searchableListKey *= -1;
                            });
                          }
                        },
                        trailing: Checkbox(
                          value: selectedCharacters.contains(character.id),
                          onChanged: (bool? value) {
                            if (value!) {
                              selectedCharacters.add(character.id);
                            } else {
                              selectedCharacters.remove(character.id);
                            }
                            setState(() {
                              _listTileKey *= -1;
                            });
                          },
                        ),
                      ),
                    ),
                    inputDecoration:
                        const InputDecoration(labelText: 'Search Character'),
                    listViewPadding: SearchableListDefault.listViewPadding(),
                  ),
                ),
              ],
            )),
      );
    }
  }
}
