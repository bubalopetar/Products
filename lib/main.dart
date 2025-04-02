// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:products/controller/products_controller.dart';
import 'package:products/enums.dart';
import 'package:products/models/product.dart';
import 'package:products/product_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Products',
      home: ProductsList(),
    );
  }
}

class ProductsList extends ConsumerStatefulWidget {
  const ProductsList({super.key});

  @override
  ConsumerState<ProductsList> createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<ProductsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(productsControllerProvider.notifier).loadMoreItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    var productsState = ref.watch(productsControllerProvider);
    return SafeArea(
      child: Scaffold(
          endDrawer: const AppDrawer(),
          backgroundColor: Colors.white,
          body: productsState.when(
            data: (data) {
              return Column(
                children: [
                  const SearchAndFilterWidget(),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.5,
                      ),
                      itemCount: data.productsToShow.length,
                      itemBuilder: (context, index) =>
                          ProductWidget(product: data.productsToShow[index]),
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => const Center(
              child: Icon(Icons.error),
            ),
            loading: () => const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            )),
          )),
    );
  }
}

class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({super.key});

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    var filter = ref.read(productsControllerProvider).value!.productsFilter;
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 24),
              child: Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Gender.male.name),
              value: filter.gender.male != null,
              onChanged: (newValue) {
                setState(() {
                  filter.gender.male = newValue == true ? Gender.male : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Gender.female.name),
              value: filter.gender.female != null,
              onChanged: (newValue) {
                setState(() {
                  filter.gender.female =
                      newValue == true ? Gender.female : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Gender.unisex.name),
              value: filter.gender.unisex != null,
              onChanged: (newValue) {
                setState(() {
                  filter.gender.unisex =
                      newValue == true ? Gender.unisex : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 24),
              child: Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CheckboxListTile(
              title: Text(Category.accessories.name),
              visualDensity: VisualDensity.compact,
              value: filter.category.accessories != null,
              onChanged: (newValue) {
                setState(() {
                  filter.category.accessories =
                      newValue == true ? Category.accessories : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Category.bags.name),
              value: filter.category.bags != null,
              onChanged: (newValue) {
                setState(() {
                  filter.category.bags =
                      newValue == true ? Category.bags : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Category.clothing.name),
              value: filter.category.clothing != null,
              onChanged: (newValue) {
                setState(() {
                  filter.category.clothing =
                      newValue == true ? Category.clothing : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Category.homeDecor.name),
              value: filter.category.homeDecor != null,
              onChanged: (newValue) {
                setState(() {
                  filter.category.homeDecor =
                      newValue == true ? Category.homeDecor : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Category.jewelry.name),
              value: filter.category.jewelry != null,
              onChanged: (newValue) {
                setState(() {
                  filter.category.jewelry =
                      newValue == true ? Category.jewelry : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Category.shoes.name),
              value: filter.category.shoes != null,
              onChanged: (newValue) {
                setState(() {
                  filter.category.shoes =
                      newValue == true ? Category.shoes : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Category.tableware.name),
              value: filter.category.tableware != null,
              onChanged: (newValue) {
                setState(() {
                  filter.category.tableware =
                      newValue == true ? Category.tableware : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              visualDensity: VisualDensity.compact,
              title: Text(Category.textilesLinens.name),
              value: filter.category.textilesLinens != null,
              onChanged: (newValue) {
                setState(() {
                  filter.category.textilesLinens =
                      newValue == true ? Category.textilesLinens : null;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      side: const BorderSide(color: Colors.black)),
                  onPressed: () {
                    ref
                        .read(productsControllerProvider.notifier)
                        .setFilter(filter);
                    ref.read(productsControllerProvider.notifier).search();
                    Scaffold.of(context).closeEndDrawer();
                  },
                  child: const Text(
                    'Filter',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchAndFilterWidget extends ConsumerStatefulWidget {
  const SearchAndFilterWidget({super.key});

  @override
  ConsumerState<SearchAndFilterWidget> createState() =>
      _SearchAndFilterWidgetState();
}

class _SearchAndFilterWidgetState extends ConsumerState<SearchAndFilterWidget> {
  final TextEditingController _searchController = TextEditingController();
  bool clearSearchInput = false;

  void clearSearch() {
    _searchController.text = '';
    ref
        .read(productsControllerProvider.notifier)
        .saveCurentSearch(_searchController.text);
    ref.read(productsControllerProvider.notifier).search();
    setState(() {
      clearSearchInput = false;
    });
  }

  void onSearchSubmitted(searchValue) {
    ref
        .read(productsControllerProvider.notifier)
        .saveCurentSearch(_searchController.text);
    ref.read(productsControllerProvider.notifier).search();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: SearchBar(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
              side:
                  const WidgetStatePropertyAll(BorderSide(color: Colors.black)),
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              elevation: WidgetStateProperty.all(0),
              onSubmitted: onSearchSubmitted,
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  clearSearchInput = value.isNotEmpty;
                });
              },
              trailing: [
                if (clearSearchInput)
                  IconButton(
                      onPressed: clearSearch, icon: const Icon(Icons.close)),
                IconButton(
                    onPressed: () => onSearchSubmitted(_searchController.text),
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(
                Icons.menu,
                size: 40,
              )),
        )
      ],
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(
                    product: product,
                  )),
        );
      },
      child: Column(
        children: [
          CachedNetworkImage(
            height: 200.0,
            fit: BoxFit.fill,
            imageUrl: product.imageLink!,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: Colors.black)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Text(
            product.brand!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            product.title!,
            textAlign: TextAlign.center,
          ),
          Text(
            product.listPrice!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                decoration: TextDecoration.lineThrough, color: Colors.grey),
          ),
          Text(
            product.salePrice!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 200.0,
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator(color: Colors.black)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
