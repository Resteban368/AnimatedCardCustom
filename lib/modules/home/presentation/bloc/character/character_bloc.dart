// ignore_for_file: avoid_print

import 'package:animated_card_custom/modules/home/data/repository/character_repository.dart';
import 'package:animated_card_custom/modules/home/domain/entities/character_entitie.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<LoadedCharacter>((event, emit) async {
      try {
        final characters = await getAllCharacter(event.page);
        if (characters != null) {
          emit(CharacterLoaded(characters, event.page));
        } else {

          emit(const CharacterError('No se pudo cargar los personajes'));
        }
      } catch (e) {
        emit(CharacterError(e.toString()));
        print('Error en el bloc Character: $e');
      }
    });
  }
}

Future<List<CharacterEntity>?> getAllCharacter(int page) async {
  final consulta = await CharacterRepository().getAllCharacter(page);
  return consulta;
}
