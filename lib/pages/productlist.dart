import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_app/globalvariables.dart';

import 'package:shop_app/pages/producedetails_page.dart';
import 'package:shop_app/widgets/productcard.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ["All", "Addidas", "Nike", "Bata"];

  late String selectedFilter;

  late Iterable<Map<String, dynamic>> filteredList;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 255, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
        right: Radius.zero,
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: outlineBorder,
                    enabledBorder: outlineBorder,
                    focusedBorder: outlineBorder,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromARGB(133, 229, 229, 229),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      label: Text(filter),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 232, 232, 232),
                          )),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: size.width < 450
                ? ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          // Adding Navigation

                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return ProductDetailsPage(product: product);
                            }),
                          );
                        },
                        child: ProductCard(
                          productTitle: product["title"] as String,
                          price: product["price"] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? Colors.cyan.shade100
                              : const Color.fromARGB(133, 229, 229, 229),
                        ),
                      );
                    },
                  )
                : GridView.builder(
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 2),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          // Adding Navigation

                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return ProductDetailsPage(product: product);
                            }),
                          );
                        },
                        child: ProductCard(
                          productTitle: product["title"] as String,
                          price: product["price"] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? Colors.cyan.shade100
                              : const Color.fromARGB(133, 229, 229, 229),
                        ),
                      );
                    },
                  ),
          ),
          // LayoutBuilder(builder: (context, constraints) {
          //   print(constraints.minWidth);
          //   return const Text("HI");
          // })
        ],
      ),
    );
  }
}
