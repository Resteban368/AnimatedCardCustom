// ignore_for_file: avoid_print

import 'package:http/http.dart';

class CharacterViewService {
  factory CharacterViewService() => _instance;

  /// Private constructor for this class.
  const CharacterViewService._();

  static const CharacterViewService _instance = CharacterViewService._();

  
  
  Future<Response> getOriginCharacter(String url) {
    print('getOriginCharacter $url');
    final response = get(Uri.parse(url));
    print('response gservice ${response.toString()}');
    return response;
  }

  
}


 