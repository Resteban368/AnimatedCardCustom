part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
  
  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}


class CharacterLoaded extends CharacterState {

  final List<Result> characters;

  const CharacterLoaded(this.characters): super();
}


class CharacterError extends CharacterState {

  final String message;

  const CharacterError(this.message): super();

  @override
  List<Object> get props => [message];
}
