part of 'origin_bloc.dart';

sealed class OriginState extends Equatable {
  const OriginState();
  
  @override
  List<Object> get props => [];
}

final class OriginInitial extends OriginState {}


class OriginLoaded extends OriginState {
  final Origin origins;

  const OriginLoaded(this.origins);

  @override
  List<Object> get props => [origins];
}


class OriginError extends OriginState {
  final String message;

  const OriginError(this.message);

  @override
  List<Object> get props => [message];
}