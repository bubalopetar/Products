// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:products/models/product.dart';
import 'package:products/models/products_filter.dart';

class ProductsState {
  List<Product> allProducts;
  List<Product> productsToShow;
  ProductsFilter productsFilter;

  String currentSearch;
  ProductsState({
    required this.allProducts,
    required this.productsToShow,
    required this.productsFilter,
    required this.currentSearch,
  });

  ProductsState copyWith({
    List<Product>? allProducts,
    List<Product>? productsToShow,
    ProductsFilter? productsFilter,
    String? currentSearch,
  }) {
    return ProductsState(
      allProducts: allProducts ?? this.allProducts,
      productsToShow: productsToShow ?? this.productsToShow,
      productsFilter: productsFilter ?? this.productsFilter,
      currentSearch: currentSearch ?? this.currentSearch,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allProducts': allProducts.map((x) => x.toMap()).toList(),
      'productsToShow': productsToShow.map((x) => x.toMap()).toList(),
      'productsFilter': productsFilter.toMap(),
      'currentSearch': currentSearch,
    };
  }

  factory ProductsState.fromMap(Map<String, dynamic> map) {
    return ProductsState(
      allProducts: List<Product>.from(
        (map['allProducts'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      productsToShow: List<Product>.from(
        (map['productsToShow'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      productsFilter:
          ProductsFilter.fromMap(map['productsFilter'] as Map<String, dynamic>),
      currentSearch: (map['currentSearch'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsState.fromJson(String source) =>
      ProductsState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsState(allProducts: $allProducts, productsToShow: $productsToShow, productsFilter: $productsFilter, currentSearch: $currentSearch)';
  }

  @override
  bool operator ==(covariant ProductsState other) {
    if (identical(this, other)) return true;

    return listEquals(other.allProducts, allProducts) &&
        listEquals(other.productsToShow, productsToShow) &&
        other.productsFilter == productsFilter &&
        other.currentSearch == currentSearch;
  }

  @override
  int get hashCode {
    return allProducts.hashCode ^
        productsToShow.hashCode ^
        productsFilter.hashCode ^
        currentSearch.hashCode;
  }
}
