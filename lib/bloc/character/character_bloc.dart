// ignore_for_file: avoid_print

import 'package:animated_card_custom/models/character.dart';
import 'package:animated_card_custom/repository/character_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<LoadedCharacter>((event, emit) async {
      try {

        print('event.page ${event.page}');
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

Future<List<Character>?> getAllCharacter(int page) async {
  final consulta = await CharacterRepository().getAllCharacter(page);
  return consulta;
}
