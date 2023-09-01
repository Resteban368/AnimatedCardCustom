import 'package:animated_card_custom/modules/character_view/data/models/origin_models.dart';
import 'package:equatable/equatable.dart';

class OriginEntity  extends Equatable{
  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<String>? residents;
  final String? url;
  final DateTime? created;

  const OriginEntity({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });


  factory OriginEntity.fromModel( Origin model) {
    return OriginEntity(
      id: model.id,
      name: model.name,
      type: model.type,
      dimension: model.dimension,
      residents: List<String>.from(model.residents!),
      url: model.url,
      created: model.created,
    );
  }



  @override
  List<Object?> get props {
    return [
      id,
      name,
      type,
      dimension,
      residents,
      url,
      created,
    ];
  }
}
