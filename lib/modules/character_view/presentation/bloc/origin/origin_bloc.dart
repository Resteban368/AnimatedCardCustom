// ignore_for_file: avoid_print

import 'package:animated_card_custom/modules/character_view/data/repository/character_view_repository.dart';
import 'package:animated_card_custom/modules/character_view/domain/entities/origin_entitie.dart';
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
    add(const LoadedOrigin(''));
  }
}

Future<OriginEntity?> getOrigin(String url) async {
  final response = await CharacterViewRepository().getOriginCharacter(url);
  return response;
}
