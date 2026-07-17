import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:games_app/mff/character/character.dart';
import 'package:games_app/mff/character/character_request.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../helper.dart';
import '../../main.dart';
import 'character_detail_screen.dart';
import 'character_new_screen.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CharactersScreenState();
  }
}

class _CharactersScreenState extends State<CharactersScreen> {
  bool isLoading = true;
  late List<Character> _characters;
  late List<Character> _filterCharacters;
  Exception? error;
  StackTrace? stackTrace;
  int _searchableListKey = 1;
  int _listTileKey = 1;
  final TextEditingController _searchController = TextEditingController();
  bool _updateOnly = false;
  final MultiSelectController<String> _tierController = MultiSelectController();
  final MultiSelectController<String> _typeController = MultiSelectController();
  final MultiSelectController<String> _genderController =
      MultiSelectController();
  final MultiSelectController<String> _sideController = MultiSelectController();
  final MultiSelectController<String> _ctpController = MultiSelectController();
  final MultiSelectController<String> _ctpStatusController =
      MultiSelectController();

  @override
  void initState() {
    super.initState();
    allCharacters().then((value) {
      _characters = value;
      filterCharacterList();
    }).onError<Exception>((error, stacktrace) {
      this.error = error;
      stackTrace = stacktrace;
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  void filterCharacterList() {
    _filterCharacters = List.from(_characters);
    if (_updateOnly) {
      _filterCharacters.removeWhere((character) => character.update == false);
    }
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
    if (_ctpController.selectedItems.isNotEmpty) {
      _filterCharacters.removeWhere((character) =>
          _ctpController.selectedItems.first.value !=
          character.ctp.toUpperCase());
    }
    if (_ctpStatusController.selectedItems.isNotEmpty) {
      _filterCharacters.removeWhere((character) =>
          _ctpStatusController.selectedItems.first.value !=
          character.ctpStatus.toUpperCase());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (error != null) {
      return Center(
        child: AutoSizeText('$error'),
      );
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: ScaffoldDefault.resizeToAvoidBottomInset(),
        appBar: AppBar(
          title: AutoSizeText(
            'Characters',
            maxLines: ScaffoldDefault.textMaxLines(),
          ),
          // leading: BackButton(onPressed: () {}),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                final bool? result = await navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => CharacterNewScreen()),
                );
                if (result != null && result) {
                  setState(() {
                    _searchableListKey *= -1;
                  });
                }
              },
            ),
          ],
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
                          SwitchListTile(
                              title: const Text('Update Only'),
                              value: _updateOnly,
                              onChanged: (bool newValue) {
                                _updateOnly = newValue;
                                filterCharacterList();
                                setState(() {
                                  _searchableListKey *= -1;
                                });
                              }),
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
                          MultiDropdown<String>(
                            items: [
                              DropdownItem(
                                  label: 'AUTHORITY', value: 'AUTHORITY'),
                              DropdownItem(
                                  label: 'COMPETITION', value: 'COMPETITION'),
                              DropdownItem(
                                  label: 'CONQUEST', value: 'CONQUEST'),
                              DropdownItem(
                                  label: 'DESTRUCTION', value: 'DESTRUCTION'),
                              DropdownItem(label: 'ENERGY', value: 'ENERGY'),
                              DropdownItem(label: 'INSIGHT', value: 'INSIGHT'),
                              DropdownItem(
                                  label: 'JUDGEMENT', value: 'JUDGEMENT'),
                              DropdownItem(label: 'RAGE', value: 'RAGE'),
                              DropdownItem(
                                  label: 'REGENERATION', value: 'REGENERATION'),
                            ],
                            onSelectionChange: (selectedItems) {
                              filterCharacterList();
                              setState(() {
                                _searchableListKey *= -1;
                              });
                            },
                            controller: _ctpController,
                            fieldDecoration:
                                const FieldDecoration(hintText: 'CTP'),
                            singleSelect: true,
                          ),
                          MultiDropdown<String>(
                            items: [
                              DropdownItem(
                                  label: 'BRILLIANT', value: 'BRILLIANT'),
                              DropdownItem(
                                  label: 'OPTION GOAL', value: 'OPTION GOAL'),
                              DropdownItem(label: 'MIGHTY', value: 'MIGHTY'),
                              DropdownItem(label: 'REGULAR', value: 'REGULAR'),
                            ],
                            onSelectionChange: (selectedItems) {
                              filterCharacterList();
                              setState(() {
                                _searchableListKey *= -1;
                              });
                            },
                            controller: _ctpStatusController,
                            fieldDecoration:
                                const FieldDecoration(hintText: 'CTP Status'),
                            singleSelect: true,
                          ),
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
                            '${character.type} - ${character.gender} - ${character.side} - ${character.tier} ${character.shadowland != 0 ? '- ${character.shadowland}' : ''}',
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
                          value: character.update,
                          onChanged: (bool? value) async {
                            character.update = value!;
                            await updateCharacter(character);
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
