// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:products/main.dart';
import 'package:products/models/product.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, required this.product});
  final Product product;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: PageView(
                      controller: _controller,
                      children: [
                        ProductImage(imageUrl: product.additionalImageLink!),
                        if (product.additionalImageLink?.isNotEmpty ?? false)
                          ProductImage(imageUrl: product.additionalImageLink!),
                        if (product.additionalImageLink2?.isNotEmpty ?? false)
                          ProductImage(imageUrl: product.additionalImageLink2!),
                        if (product.additionalImageLink3?.isNotEmpty ?? false)
                          ProductImage(imageUrl: product.additionalImageLink3!),
                        if (product.additionalImageLink4?.isNotEmpty ?? false)
                          ProductImage(imageUrl: product.additionalImageLink4!),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 24),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect: WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.transparent.withOpacity(0.2),
                      activeDotColor: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.brand!,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 75.0,
                          height: 75.0,
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Text(
                            product.collection ?? '',
                            style: const TextStyle(color: Colors.white),
                          )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        product.title!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        children: [
                          Text(
                            product.listPrice!,
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            product.salePrice!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1), // Border customization
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Size: ${product.sizes}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Text(product.availability!,
                          style: const TextStyle(fontWeight: FontWeight.w400)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                        fixedSize: const Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      child: const Text(
                        'Add to bag',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
