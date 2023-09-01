// ignore_for_file: avoid_print

import 'package:http/http.dart';

class CharacterService {
  factory CharacterService() => _instance;

  /// Private constructor for this class.
  const CharacterService._();

  static const CharacterService _instance = CharacterService._();

  /// The service origin.
  String get serviceOrigin => 'https://rickandmortyapi.com/api/character';

  Future<Response> getCharacterByName(String name) {
    print('CharacterService getCharacterByName' );
     final response =  get(Uri.parse('$serviceOrigin/?name=$name'));
      print('$serviceOrigin/name:$name');
    return response;
  }

  
  
  Future<Response> getAllCharacters() {
    print('serviceOrigin $serviceOrigin');
    final response = get(Uri.parse(serviceOrigin));
    print('response gservice ${response.toString()}');
    return response;
  }

   
}
