import 'dart:convert';
import 'package:animated_card_custom/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterRepository {
  factory CharacterRepository() => _singleton;

  CharacterRepository._();

  static final CharacterRepository _singleton = CharacterRepository._();

  Future<List<Result>?> getAllCharacter() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('https://rickandmortyapi.com/api/character'));

      http.StreamedResponse response = await request.send();



      if (response.statusCode < 400) {
        final respStr = await response.stream.bytesToString();
        final characterResponse =
            CharacterResponse.fromMap(json.decode(respStr));
        return characterResponse.results;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e, s) {
      print('error en el repositorio de character getAllCharacter $e => $s');
    }
  }

  
}
