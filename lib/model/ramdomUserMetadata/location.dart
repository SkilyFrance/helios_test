import 'dart:convert';

class Location {
  String city;
  String state;
  String country;

  Location({
    required this.city,
    required this.state,
    required this.country,
  });

  Location copyWith({
    String? city,
    String? state,
    String? country,
  }) {
    return Location(
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      city: map['city'],
      state: map['state'],
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() =>
      'Location(city: $city, state: $state, country: $country)';
}
