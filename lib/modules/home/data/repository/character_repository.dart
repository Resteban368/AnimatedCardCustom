// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'dart:convert';
import 'package:animated_card_custom/modules/home/data/models/character_models.dart';
import 'package:animated_card_custom/modules/home/domain/entities/character_entitie.dart';

import '../services/character_service.dart';

class CharacterRepository {
  factory CharacterRepository() => _singleton;

  CharacterRepository._();

  static final CharacterRepository _singleton = CharacterRepository._();
  List<CharacterEntity>? characters;

  Future<List<CharacterEntity>?> getAllCharacter(int page) async {
    try {
      final response = await CharacterService().getAllCharacters();

      if (response.statusCode < 400) {
        final characterResponse = CharacterResponse.fromJson(
            json.decode(response.body) as Map<String, dynamic>);

        final List<Character>? newCharacters2 = characterResponse.results;

        print('newCharacters2 ${newCharacters2!.length}');

        //pasar de model a entity
        final List<CharacterEntity> newCharacters =
            newCharacters2.map((e) => CharacterEntity.fromModel(e)).toList();

        return newCharacters;
      }
    } catch (e, s) {
      print('error en el repositorio de character getAllCharacter $e => $s');
    }
    return null;
  }

  Future<List<CharacterEntity>> getCharacterByName(String name) async {
    try {
      print('CharacterRepository getCharacterByName');
      final response = await CharacterService().getCharacterByName(name);

      print('response.statusCode ${response.statusCode}');
      if (response.statusCode < 400) {
        final characterResponse = CharacterResponse.fromJson(
            json.decode(response.body) as Map<String, dynamic>);

            print('characterResponse.results $characterResponse');

        final List<Character>? newCharacters2 = characterResponse.results;

        final List<CharacterEntity> newCharacters =
            newCharacters2!.map((e) => CharacterEntity.fromModel(e)).toList();

        return newCharacters;
      }
    } catch (e, s) {
      print('error en el repositorio de character getCharacterByName $e => $s');
    }
    return [];
  }
 
}
