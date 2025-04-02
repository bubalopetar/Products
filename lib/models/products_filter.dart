// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:products/models/category.dart';
import 'package:products/models/gender.dart';

class ProductsFilter {
  GenderFilter gender;
  CategoryFilter category;
  ProductsFilter({
    required this.gender,
    required this.category,
  });
  factory ProductsFilter.init() {
    return ProductsFilter(gender: GenderFilter(), category: CategoryFilter());
  }
  bool get isSet => this != ProductsFilter.init();

  ProductsFilter copyWith({
    GenderFilter? gender,
    CategoryFilter? category,
  }) {
    return ProductsFilter(
      gender: gender ?? this.gender,
      category: category ?? this.category,
    );
  }

  @override
  String toString() => 'ProductsFilter(gender: $gender, category: $category)';

  @override
  bool operator ==(covariant ProductsFilter other) {
    if (identical(this, other)) return true;

    return other.gender == gender && other.category == category;
  }

  @override
  int get hashCode => gender.hashCode ^ category.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gender': gender.toMap(),
      'category': category.toMap(),
    };
  }

  factory ProductsFilter.fromMap(Map<String, dynamic> map) {
    return ProductsFilter(
      gender: GenderFilter.fromMap(map['gender'] as Map<String, dynamic>),
      category: CategoryFilter.fromMap(map['category'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsFilter.fromJson(String source) =>
      ProductsFilter.fromMap(json.decode(source) as Map<String, dynamic>);
}
