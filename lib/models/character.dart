// To parse this JSON data, do
//
//     final characterResponse = characterResponseFromMap(jsonString);

import 'dart:convert';

class CharacterResponse {
    Info? info;
    List<Result>? results;

    CharacterResponse({
        this.info,
        this.results,
    });

    factory CharacterResponse.fromJson(String str) => CharacterResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CharacterResponse.fromMap(Map<String, dynamic> json) => CharacterResponse(
        info: json["info"] == null ? null : Info.fromMap(json["info"]),
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "info": info?.toMap(),
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
    };
}

class Info {
    int? count;
    int? pages;
    String? next;
    dynamic prev;

    Info({
        this.count,
        this.pages,
        this.next,
        this.prev,
    });

    factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

class Result {
    int? id;
    String? name;
    Status? status;
    Species? species;
    String? type;
    Gender? gender;
    Location? origin;
    Location? location;
    String? image;
    List<String>? episode;
    String? url;
    DateTime? created;

    Result({
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

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        species: speciesValues.map[json["species"]]!,
        type: json["type"],
        gender: genderValues.map[json["gender"]]!,
        origin: json["origin"] == null ? null : Location.fromMap(json["origin"]),
        location: json["location"] == null ? null : Location.fromMap(json["location"]),
        image: json["image"],
        episode: json["episode"] == null ? [] : List<String>.from(json["episode"]!.map((x) => x)),
        url: json["url"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "species": speciesValues.reverse[species],
        "type": type,
        "gender": genderValues.reverse[gender],
        "origin": origin?.toMap(),
        "location": location?.toMap(),
        "image": image,
        "episode": episode == null ? [] : List<dynamic>.from(episode!.map((x) => x)),
        "url": url,
        "created": created?.toIso8601String(),
    };
}

enum Gender { MALE, FEMALE, UNKNOWN }

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Male": Gender.MALE,
    "unknown": Gender.UNKNOWN
});

class Location {
    String? name;
    String? url;

    Location({
        this.name,
        this.url,
    });

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

enum Species { HUMAN, ALIEN }

final speciesValues = EnumValues({
    "Alien": Species.ALIEN,
    "Human": Species.HUMAN
});

enum Status { ALIVE, UNKNOWN, DEAD }

final statusValues = EnumValues({
    "Alive": Status.ALIVE,
    "Dead": Status.DEAD,
    "unknown": Status.UNKNOWN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
