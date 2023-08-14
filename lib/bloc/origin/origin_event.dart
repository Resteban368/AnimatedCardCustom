part of 'origin_bloc.dart';

sealed class OriginEvent extends Equatable {
  const OriginEvent();

  @override
  List<Object> get props => [];
}


class LoadedOrigin extends OriginEvent {
  final String url;

  LoadedOrigin(this.url);

  @override
  List<Object> get props => [url];
}