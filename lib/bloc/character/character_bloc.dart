import 'package:animated_card_custom/models/character.dart';
import 'package:animated_card_custom/repository/character_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {



  CharacterBloc() : super(CharacterInitial()) {
    on<LoadedCharacter>((event, emit) async{
      try {
        final  characters = await getAllCharacter();
        if(characters != null){
          emit(CharacterLoaded(characters));
        }else{
          emit(CharacterError('No se pudo cargar los personajes'));
        }
        
      } catch (e) {
        emit(CharacterError(e.toString()));
        print('Error en el bloc Character: $e');
      }
    });

    add(const LoadedCharacter());
  }
}



Future<List<Result>?> getAllCharacter()async{
  final consulta = await CharacterRepository().getAllCharacter();
  return consulta;
}