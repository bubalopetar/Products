// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:products/enums.dart';

class CategoryFilter {
  Category? accessories;
  Category? bags;
  Category? jewelry;
  Category? shoes;
  Category? tableware;
  Category? textilesLinens;
  Category? homeDecor;
  Category? clothing;
  CategoryFilter({
    this.accessories,
    this.bags,
    this.jewelry,
    this.shoes,
    this.tableware,
    this.textilesLinens,
    this.homeDecor,
    this.clothing,
  });

  CategoryFilter copyWith({
    Category? accessories,
    Category? bags,
    Category? jewelry,
    Category? shoes,
    Category? tableware,
    Category? textilesLinens,
    Category? homeDecor,
    Category? clothing,
  }) {
    return CategoryFilter(
      accessories: accessories ?? this.accessories,
      bags: bags ?? this.bags,
      jewelry: jewelry ?? this.jewelry,
      shoes: shoes ?? this.shoes,
      tableware: tableware ?? this.tableware,
      textilesLinens: textilesLinens ?? this.textilesLinens,
      homeDecor: homeDecor ?? this.homeDecor,
      clothing: clothing ?? this.clothing,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessories': accessories?.name,
      'bags': bags?.name,
      'jewelry': jewelry?.name,
      'shoes': shoes?.name,
      'tableware': tableware?.name,
      'textilesLinens': textilesLinens?.name,
      'homeDecor': homeDecor?.name,
      'clothing': clothing?.name,
    };
  }

  factory CategoryFilter.fromMap(Map<String, dynamic> map) {
    return CategoryFilter(
      accessories: map['accessories'] != null ? Category.accessories : null,
      bags: map['bags'] != null ? Category.bags : null,
      jewelry: map['jewelry'] != null ? Category.jewelry : null,
      shoes: map['shoes'] != null ? Category.shoes : null,
      tableware: map['tableware'] != null ? Category.tableware : null,
      textilesLinens:
          map['textilesLinens'] != null ? Category.textilesLinens : null,
      homeDecor: map['homeDecor'] != null ? Category.homeDecor : null,
      clothing: map['clothing'] != null ? Category.clothing : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryFilter.fromJson(String source) =>
      CategoryFilter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryFilter(accessories: $accessories, bags: $bags, jewelry: $jewelry, shoes: $shoes, tableware: $tableware, textilesLinens: $textilesLinens, homeDecor: $homeDecor, clothing: $clothing)';
  }

  @override
  bool operator ==(covariant CategoryFilter other) {
    if (identical(this, other)) return true;

    return other.accessories == accessories &&
        other.bags == bags &&
        other.jewelry == jewelry &&
        other.shoes == shoes &&
        other.tableware == tableware &&
        other.textilesLinens == textilesLinens &&
        other.homeDecor == homeDecor &&
        other.clothing == clothing;
  }

  @override
  int get hashCode {
    return accessories.hashCode ^
        bags.hashCode ^
        jewelry.hashCode ^
        shoes.hashCode ^
        tableware.hashCode ^
        textilesLinens.hashCode ^
        homeDecor.hashCode ^
        clothing.hashCode;
  }
}
