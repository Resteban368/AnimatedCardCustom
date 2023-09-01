// ignore_for_file: avoid_print

import 'package:animated_card_custom/modules/character_view/data/models/origin_models.dart';
import 'package:animated_card_custom/modules/character_view/data/services/character_view_service.dart';
import 'package:animated_card_custom/modules/character_view/domain/entities/origin_entitie.dart';

class CharacterViewRepository {
  factory CharacterViewRepository() => _singleton;

  CharacterViewRepository._();

  static final CharacterViewRepository _singleton = CharacterViewRepository._();

  Future<OriginEntity?> getOriginCharacter(String url) async {
    try {
      final response = await CharacterViewService().getOriginCharacter(url);

      if (response.statusCode < 400) {
        final originResponse = Origin.fromJson(response.body);

        final OriginEntity originEntity =
            OriginEntity.fromModel(originResponse);

        return originEntity;
      }
    } catch (e, s) {
      print(
          'error en el repositorio de character view getOriginCharacter $e => $s');
    }
    return null;
  }
}
