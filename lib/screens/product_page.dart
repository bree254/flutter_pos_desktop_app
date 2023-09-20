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
      child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ProductPageInfo(
              teamName: 'Simon BBQ Team',
              locationId: 'SIMON123',
              lastSynced: '3 minutes ago',
              helpText: 'Help',
            ),
           SizedBox(height: 20,),
           MenuTab(),
            SizedBox(height: 20,),

            Expanded(child: ProductGrid(),)
          ],
        ),
      ),
    );
  }
}
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 0.8,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                  ),
                ),
                Text(
                  quantity,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ProductPageInfo extends StatelessWidget {
  final String teamName;
  final String locationId;
  final String lastSynced;
  final String helpText;

  ProductPageInfo({
    required this.teamName,
    required this.locationId,
    required this.lastSynced,
    required this.helpText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                teamName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5),
            Text(
                'Location ID #$locationId',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Last Synced',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.fiber_manual_record,
                  color: Colors.red,
                  size: 16, // Adjust the size as needed
                ),
                Text(lastSynced),
              ],
            ),
          ],
        ),
        SizedBox(width: 20),
        Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.help_outline),
                SizedBox(width: 4),
                Text(helpText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: List.generate(MenuItems.length, (index) {
          final item = MenuItems[index];
          final isActive = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                  color: isActive ? Colors.orange : Colors.transparent,
                borderRadius: BorderRadius.circular(20)
              ),

              child: Text(
                item,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}








