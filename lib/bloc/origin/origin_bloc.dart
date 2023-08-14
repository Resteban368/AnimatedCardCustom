// ignore_for_file: avoid_print

import 'package:animated_card_custom/models/origin_models.dart';
import 'package:animated_card_custom/repository/character_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'origin_event.dart';
part 'origin_state.dart';

class OriginBloc extends Bloc<OriginEvent, OriginState> {


  OriginBloc() : super(OriginInitial()) {
    on<LoadedOrigin>((event, emit) async {
      try {
        print('LoadedOrigin');

        final origin = await getOrigin(event.url);
        emit(OriginLoaded(origin!));
      } catch (e, s) {
        print('Error en el Bloc Origin $e, $s');
        emit(OriginError(e.toString()));
      }
    });
    add(LoadedOrigin(''));
  }
}

Future<Origin?> getOrigin(String url) async {
  final response = await CharacterRepository().getOriginCharacter(url);
  return response;
}
