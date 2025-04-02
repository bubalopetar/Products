// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:products/enums.dart';
import 'package:products/models/category.dart';
import 'package:products/models/gender.dart';
import 'package:products/models/products_filter.dart';
import 'package:products/models/products_state.dart';
import 'package:products/shared_prefs_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:products/models/product.dart';
part 'products_controller.g.dart';

@riverpod
class ProductsController extends _$ProductsController {
  @override
  Future<ProductsState> build() async {
    await Future.delayed(const Duration(seconds: 2));
    var allProducts = await loadProducts();
    var productsToShow = allProducts.sublist(0, 10);

    return ProductsState(
      currentSearch: '',
      allProducts: allProducts,
      productsToShow: productsToShow,
      productsFilter:
          ProductsFilter(gender: GenderFilter(), category: CategoryFilter()),
    );
  }

  // Loads product data from the JSON file.
  Future<List<Product>> loadProducts() async {
    String? jsonString;
    var dataSavedInPreferences = await SharedPrefsService.keyExists();
    if (dataSavedInPreferences ?? false) {
      jsonString = await SharedPrefsService.readData();
    } else {
      try {
        jsonString = await rootBundle.loadString('assets/product_data.json');
        SharedPrefsService.writeData(jsonString);
      } catch (e) {
        return [];
      }
    }
    var decodedString = jsonDecode(jsonString!) as List;
    return decodedString.map((e) => Product.fromMap(e)).toList();
  }

  // Loads more items if not filtered or searched.
  void loadMoreItems() {
    final productsState = state.value;
    if (productsState == null ||
        productsState.currentSearch.isNotEmpty ||
        productsState.productsFilter.isSet) {
      return;
    }

    state = AsyncData(productsState.copyWith(
      productsToShow: productsState.allProducts.sublist(
        0,
        productsState.productsToShow.length + 10,
      ),
    ));
  }

  // Searches products based on the search value.
  void search() {
    var searchTerm = state.value!.currentSearch;
    saveCurentSearch(searchTerm);
    final productsState = state.value;
    if (productsState == null) return;

    List<Product> searchResultsProducts = searchTerm.isNotEmpty
        ? productsState.allProducts.where((product) {
            return product.title
                    ?.toLowerCase()
                    .contains(searchTerm.toLowerCase()) ??
                false;
          }).toList()
        : productsState.allProducts;

    if (state.value!.productsFilter.isSet) {
      searchResultsProducts = _applyGenderFilter(searchResultsProducts);
      searchResultsProducts = _applyCategoryFilter(searchResultsProducts);
    }
    state = AsyncData(productsState.copyWith(
      productsToShow: searchResultsProducts,
    ));
  }

  void setFilter(ProductsFilter filter) {
    state = AsyncData(state.value!.copyWith(productsFilter: filter));
  }

  // Helper function to apply gender-based filtering.
  List<Product> _applyGenderFilter(List<Product> products) {
    List<Product> filteredProducts = [];
    var filter = state.value!.productsFilter;

    if (filter.gender.male != null) {
      var matched = products
          .where((product) => product.gender == Gender.male.name.toLowerCase())
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }
    if (filter.gender.female != null) {
      var matched = products
          .where(
              (product) => product.gender == Gender.female.name.toLowerCase())
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }
    if (filter.gender.unisex != null) {
      var matched = products
          .where(
              (product) => product.gender == Gender.unisex.name.toLowerCase())
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }

    return filteredProducts.isEmpty ? products : filteredProducts;
  }

  List<Product> _applyCategoryFilter(List<Product> products) {
    List<Product> filteredProducts = [];
    var filter = state.value!.productsFilter;

    if (filter.category.accessories != null) {
      var matched = products
          .where((product) => product.category == Category.accessories.name)
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }
    if (filter.category.bags != null) {
      var matched = products
          .where((product) => product.category == Category.bags.name)
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }
    if (filter.category.clothing != null) {
      var matched = products
          .where((product) => product.category == Category.clothing.name)
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }
    if (filter.category.homeDecor != null) {
      var matched = products
          .where((product) => product.category == Category.homeDecor.name)
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }
    if (filter.category.jewelry != null) {
      var matched = products
          .where((product) => product.category == Category.jewelry.name)
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }
    if (filter.category.shoes != null) {
      var matched = products
          .where((product) => product.category == Category.shoes.name)
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }
    if (filter.category.tableware != null) {
      var matched = products
          .where((product) => product.category == Category.tableware.name)
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }
    if (filter.category.textilesLinens != null) {
      var matched = products
          .where((product) => product.category == Category.textilesLinens.name)
          .toList();
      if (matched.isNotEmpty) {
        filteredProducts = [...filteredProducts, ...matched];
      }
    }

    return filteredProducts.isEmpty ? products : filteredProducts;
  }

  void saveCurentSearch(String searchTerm) {
    state = AsyncData(state.value!.copyWith(currentSearch: searchTerm));
  }
}
