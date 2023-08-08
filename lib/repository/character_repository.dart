// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:animated_card_custom/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterRepository {
  factory CharacterRepository() => _singleton;

  CharacterRepository._();

  static final CharacterRepository _singleton = CharacterRepository._();
  List<Character>? characters;

  Future<List<Character>?> getAllCharacter(int page) async {
    print('getAllCharacter');
    try {
      final url = 'https://rickandmortyapi.com/api/character/?page=$page';

      final result = await http.get(Uri.parse(url));
      print('result.statusCode ${result.statusCode}');
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
}
