import 'package:flutter/material.dart';
import 'package:shop_app/pages/cartpage.dart';

import 'package:shop_app/pages/productlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> pages = const [
  ProductList(),
  CartPage(),
];

class _HomeState extends State<Home> {
  final List<String> filters = const ["All", "Addidas", "Nike", "Bata"];
  late String selectedFilter;
  late Iterable<Map<String, dynamic>> filteredList;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 26,
        selectedItemColor: const Color.fromARGB(255, 1, 130, 172),
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: "Cart",
          )
        ],
      ),
    );
  }
}
