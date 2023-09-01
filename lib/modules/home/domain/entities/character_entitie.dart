import 'package:equatable/equatable.dart';

import '../../data/models/character_models.dart';

class CharacterEntity extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final Location ?origin;
  final Location? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

  const CharacterEntity({
     this.id,
     this.name,
     this.status,
     this.species,
     this.type,
     this.gender,
     this.origin,
     this.location,
     this.image,
     this.episode,
     this.url,
     this.created,
  });

  factory CharacterEntity.fromModel(Character model) {
    return CharacterEntity(
      id: model.id,
      name: model.name,
      status: model.status,
      species: model.species,
      type: model.type,
      gender: model.gender,
      origin: model.origin,
      location: model.location,
      image: model.image,
      episode: List<String>.from(model.episode!),
      url: model.url,
      created: model.created,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      episode,
      url,
      created,
    ];
  }
}

// class Location {
//   final String? name;
//   final String? url;

//   Location({
//      this.name,
//      this.url,
//   });

//   factory Location.fromModel(Location model) {
//     return Location(
//       name: model.name,
//       url: model.url,
//     );
//   }
// }



// class Location {
//   String? name;
//   String? url;

//   Location({
//     this.name,
//     this.url,
//   });

//   // factory Location.fromJson(Map<String, dynamic> json) => Location(
//   //       name: json["name"],
//   //       url: json["url"],
//   //     );

//   // Map<String, dynamic> toJson() => {
//   //       "name": name,
//   //       "url": url,
//   //     };
// }