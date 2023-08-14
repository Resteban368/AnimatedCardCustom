// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'dart:convert';
import 'package:animated_card_custom/models/character_models.dart';
import 'package:animated_card_custom/models/origin_models.dart';
import 'package:http/http.dart' as http;

class CharacterRepository {
  factory CharacterRepository() => _singleton;

  CharacterRepository._();

  static final CharacterRepository _singleton = CharacterRepository._();
  List<Character>? characters;

  Future<List<Character>?> getAllCharacter(int page) async {
    try {
      const url = 'https://rickandmortyapi.com/api/character/';
      final result = await http.get(Uri.parse(url));
      if (result.statusCode < 400) {
        final characterResponse = CharacterResponse.fromJson(
            json.decode(result.body) as Map<String, dynamic>);
        final List<Character>? newCharacters = characterResponse.results;
        if (characters != null) {
          characters!.addAll(newCharacters!);
        } else {
          characters = newCharacters;
        }

        print('characters ${characters![0].name}');
        return characters;
      }
    } catch (e, s) {
      print('error en el repositorio de character getAllCharacter $e => $s');
    }
    return null;
  }

  Future<List<Character>> getCharacterByName(String name) async {
    try {
      const url = 'rickandmortyapi.com';
      final result =
          await http.get(Uri.https(url, '/api/character/', {'name': name}));
      final response = characterResponseFromJson(result.body);
      return response.results!;
    } catch (e, s) {
      print('error en el repositorio de character getCharacter $e => $s');
    }
    return [];
  }

  //todo consultar el origin

  Future<Origin?> getOriginCharacter(String url) async {
    try {
      var request = http.Request(
          'GET', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final jsonDecode =
            Origin.fromMap(json.decode(await response.stream.bytesToString()));
        return jsonDecode;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e, s) {
      print('error en el repositorio de character getOriginCharacter $e => $s');
    }
  }
}
