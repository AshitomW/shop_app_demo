import "package:flutter/material.dart";

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productTitle,
    required this.price,
    required this.image,
    required this.backgroundColor,
  });

  final String productTitle;
  final double price;
  final String image;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      //
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productTitle, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image(
              image: AssetImage(image),
              height: 170,
            ),
          )
        ],
      ),
    );
  }
}
