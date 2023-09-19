import 'package:flutter/material.dart';
import 'package:flutter_desktop_pos_app/data/data_class.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width * .7,
      child: Column(
        children: [
          Expanded(child: ProductGrid(),)
        ],
      ),
    );
  }
}
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns in the grid
        mainAxisSpacing: 4.0, // Spacing between rows
        crossAxisSpacing: 4.0, // Spacing between columns
        childAspectRatio: 0.6, // Aspect ratio (width/height) of each grid item
      ),
      itemBuilder: (context, index) {
        final product = productItems[index];
        return ProductItem(
          title: product.title,
          quantity: product.quantity,
          price: product.price,
          imageUrl: product.imageurl,
        );
      },
    );
  }
}
class ProductItem extends StatelessWidget {
  final String title;
  final String quantity;
  final String price;
  final String imageUrl;

  ProductItem({
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
     elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl), // Display the product image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title), // Display the product title
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(quantity), // Display the product quantity
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(price), // Display the product price
          ),
        ],
      ),
    );
  }
}


