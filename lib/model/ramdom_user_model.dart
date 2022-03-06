import 'dart:convert';

import 'package:helios_test/model/ramdomUserMetadata/location.dart';
import 'package:helios_test/model/ramdomUserMetadata/name.dart';
import 'package:helios_test/model/ramdomUserMetadata/picture.dart';

class RamdomUser {
  String gender;
  Name name;
  Location location;
  String email;
  Picture picture;

  RamdomUser({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.picture,
  });

  RamdomUser copyWith({
    String? gender,
    Name? name,
    Location? location,
    String? email,
    Picture? picture,
  }) {
    return RamdomUser(
      gender: gender ?? this.gender,
      name: name ?? this.name,
      location: location ?? this.location,
      email: email ?? this.email,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gender': gender,
      'name': name.toMap(),
      'location': location.toMap(),
      'email': email,
      'picture': picture.toMap(),
    };
  }

  factory RamdomUser.fromMap(Map<String, dynamic> map) {
    return RamdomUser(
      gender: map['gender'],
      name: Name.fromMap(map['name']),
      location: Location.fromMap(map['location']),
      email: map['email'],
      picture: Picture.fromMap(map['picture']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RamdomUser.fromJson(String source) =>
      RamdomUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RamdomUser(gender: $gender, name: $name, location: $location, email: $email, picture: $picture)';
  }
}
