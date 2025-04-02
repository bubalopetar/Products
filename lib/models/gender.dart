import 'dart:convert';

import 'package:products/enums.dart';

class GenderFilter {
  Gender? male;
  Gender? female;
  Gender? unisex;
  GenderFilter({
    this.male,
    this.female,
    this.unisex,
  });

  GenderFilter copyWith({
    Gender? male,
    Gender? female,
    Gender? unisex,
  }) {
    return GenderFilter(
      male: male ?? this.male,
      female: female ?? this.female,
      unisex: unisex ?? this.unisex,
    );
  }

  @override
  String toString() => 'Gender(male: $male, female: $female, unisex: $unisex)';

  @override
  bool operator ==(covariant GenderFilter other) {
    if (identical(this, other)) return true;

    return other.male == male &&
        other.female == female &&
        other.unisex == unisex;
  }

  @override
  int get hashCode => male.hashCode ^ female.hashCode ^ unisex.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'male': male?.name,
      'female': female?.name,
      'unisex': unisex?.name
    };
  }

  factory GenderFilter.fromMap(Map<String, dynamic> map) {
    return GenderFilter(
      male: map['male'] != null ? Gender.male : null,
      female: map['female'] != null ? Gender.female : null,
      unisex: map['unisex'] != null ? Gender.unisex : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenderFilter.fromJson(String source) =>
      GenderFilter.fromMap(json.decode(source) as Map<String, dynamic>);
}
