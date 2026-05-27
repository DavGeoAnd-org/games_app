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
  late List<Character> characters;
  late List<Character> characterList = List.from(characters);
  Exception? error;
  StackTrace? stackTrace;
  int _searchableListKey = 1;
  int _listTileKey = 1;
  final TextEditingController _searchController = TextEditingController();
  bool _updateOnly = false;
  final MultiSelectController<String> _tierController = MultiSelectController();

  @override
  void initState() {
    super.initState();
    allCharacters().then((value) {
      characters = value;
    }).onError<Exception>((error, stacktrace) {
      this.error = error;
      stackTrace = stacktrace;
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  List<Character> updateCharacterList() {
    characterList = List.from(characters);
    if (_updateOnly) {
      characterList.removeWhere((character) => character.update == false);
    }
    if (_tierController.selectedItems.isNotEmpty) {
      characterList.removeWhere((character) {
        List<String> selectedTiers = List.empty(growable: true);
        for (var dropdownItem in _tierController.selectedItems) {
          selectedTiers.add(dropdownItem.value);
        }
        return !selectedTiers.contains(character.tier.value.toUpperCase());
      });
    }
    return characterList;
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
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SwitchListTile(
                              title: const Text('Update Only'),
                              value: _updateOnly,
                              onChanged: (bool newValue) {
                                _updateOnly = newValue;
                                updateCharacterList();
                                setState(() {
                                  _searchableListKey *= -1;
                                });
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: MultiDropdown<String>(
                            items: [
                              DropdownItem(label: 'T1', value: 'T1'),
                              DropdownItem(label: 'T2', value: 'T2'),
                              DropdownItem(label: 'T3', value: 'T3'),
                              DropdownItem(label: 'TP', value: 'TP'),
                              DropdownItem(label: 'T4', value: 'T4'),
                            ],
                            onSelectionChange: (selectedItems) {
                              updateCharacterList();
                              setState(() {
                                _searchableListKey *= -1;
                              });
                            },
                            controller: _tierController,
                            fieldDecoration:
                                const FieldDecoration(hintText: 'Tier'),
                          ),
                        )
                      ],
                    )),
                Expanded(
                  flex: 5,
                  child: SearchableList<Character>(
                    key: ValueKey(_searchableListKey),
                    searchTextController: _searchController,
                    initialList: characterList,
                    filter: (query) {
                      return characterList
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
