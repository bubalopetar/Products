import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products/controller/products_controller.dart';
import 'package:products/enums.dart';
import 'package:products/models/category.dart';
import 'package:products/models/gender.dart';
import 'package:products/models/product.dart';
import 'package:products/models/products_filter.dart';
import 'package:products/models/products_state.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  testBuildMethod();
  testloadProductsMethod();
  testLoadMoreMethod();
  testSaveCurentSearchMethod();
  testSetFilterMethod();
  testSearchMethod();
}

void testBuildMethod() {
  group('Test build() method', () {
    test('returns ProductsState', () async {
      final container = createContainer();
      var defaultState =
          await container.read(productsControllerProvider.future);
      expectLater(
        defaultState,
        isA<ProductsState>(),
      );
    });
    test('returns 10 items to show', () async {
      final container = createContainer();
      var defaultState =
          await container.read(productsControllerProvider.future);

      expectLater(
        defaultState.productsToShow.length,
        10,
      );
    });
  });
}

void testloadProductsMethod() {
  group('Test loadProducts() method', () {
    test('returns List<Product>', () async {
      final container = createContainer();

      var products = await container
          .read(productsControllerProvider.notifier)
          .loadProducts();
      expectLater(
        products,
        isA<List<Product>>(),
      );
    });
  });
}

void testLoadMoreMethod() {
  group('Test loadMore() method', () {
    test('loads 10 more items', () async {
      final container = createContainer();

      final subscription = container.listen(
        productsControllerProvider,
        (_, __) {},
      );
      var notifier = container.read(productsControllerProvider.notifier);
      await notifier.build();
      notifier.loadMoreItems();
      expect(
        subscription.read().value!.productsToShow.length,
        20,
      );
    });
  });
}

void testSaveCurentSearchMethod() {
  group('Test saveCurentSearch() method', () {
    test('saves current search term', () async {
      final container = createContainer();
      final subscription = container.listen(
        productsControllerProvider,
        (_, __) {},
      );
      var notifier = container.read(productsControllerProvider.notifier);
      await notifier.build();

      notifier.saveCurentSearch('belt');

      expect(
        subscription.read().value!.currentSearch,
        'belt',
      );
    });
  });
}

void testSetFilterMethod() {
  group('Test setFilter() method', () {
    test('saves selected filter', () async {
      final container = createContainer();
      final subscription = container.listen(
        productsControllerProvider,
        (_, __) {},
      );
      var notifier = container.read(productsControllerProvider.notifier);
      await notifier.build();

      notifier.setFilter(ProductsFilter(
          gender: GenderFilter(male: Gender.male), category: CategoryFilter()));

      expect(
        subscription.read().value!.productsFilter.gender.male,
        Gender.male,
      );
    });
  });
}

void testSearchMethod() {
  group('Test search() method', () {
    test('shows only items with search term', () async {
      final container = createContainer();
      final subscription = container.listen(
        productsControllerProvider,
        (_, __) {},
      );
      var notifier = container.read(productsControllerProvider.notifier);
      await notifier.build();
      notifier.saveCurentSearch('belt');
      notifier.search();

      var searchTermCountInShownProducts = subscription
          .read()
          .value!
          .productsToShow
          .where((product) => product.title!.toLowerCase().contains('belt'))
          .length;
      var numberOfProductsShown =
          subscription.read().value!.productsToShow.length;
      expect(searchTermCountInShownProducts, numberOfProductsShown);
    });
    test('shows only items with search term and male filter', () async {
      final container = createContainer();
      final subscription = container.listen(
        productsControllerProvider,
        (_, __) {},
      );
      var notifier = container.read(productsControllerProvider.notifier);
      await notifier.build();
      notifier.saveCurentSearch('belt');
      notifier.setFilter(ProductsFilter(
          gender: GenderFilter(male: Gender.male), category: CategoryFilter()));
      notifier.search();

      var numberOfProducts = subscription
          .read()
          .value!
          .productsToShow
          .where((product) =>
              product.title!.toLowerCase().contains('belt') ||
              product.gender!.toLowerCase().contains('male'))
          .length;

      expect(
          numberOfProducts, subscription.read().value!.productsToShow.length);
    });
  });
}
