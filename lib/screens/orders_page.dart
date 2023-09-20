import 'package:flutter/material.dart';
import 'package:flutter_desktop_pos_app/data/data_class.dart';
class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Container(
      height: size.height,
      width: size.width *.3,
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          children: [
            TopOrderMenu(
              title: 'Current Order',
              onClearAllPressed: () {

              },
              onSettingsPressed: () {

              },
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderItemWidget(order: orders[index]);
              },
            ),
            ),
            Expanded(
              child:
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sub Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,

                            ),
                          ),
                          Text(
                            '\$40.32',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,

                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Tax',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,

                            ),
                          ),
                          Text(
                            '\$4.32',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,

                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: 2,
                        width: double.infinity,

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,

                            ),
                          ),
                          Text(
                            '\$44.64',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,

                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.print, size: 16),
                            SizedBox(width: 6),
                            Text('Pay with Cash')
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.print, size: 16),
                            SizedBox(width: 6),
                            Text('Pay with Mpesa')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),

      )

    );
  }
}

class TopOrderMenu extends StatelessWidget {
  final String title;
  final VoidCallback onClearAllPressed;
  final VoidCallback onSettingsPressed;

  TopOrderMenu({
    required this.title,
    required this.onClearAllPressed,
    required this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Spacer(),
        InkWell(
          onTap: onClearAllPressed,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text('Clear All'),
            ),
          ),
        ),
        SizedBox(width: 20),
        InkWell(
          onTap: onSettingsPressed,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Icon(Icons.settings_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
class OrderItemWidget extends StatelessWidget {
  final Order order;

  OrderItemWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child:
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(order.image),
                    fit: BoxFit.cover,
                  ),
                ),

              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        order.title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        '\$${order.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              AddDeleteCountWidget(),
            ],
          ),



    );
  }
}

class AddDeleteCountWidget extends StatefulWidget {
  @override
  _AddDeleteCountWidgetState createState() => _AddDeleteCountWidgetState();
}

class _AddDeleteCountWidgetState extends State<AddDeleteCountWidget> {
  int itemCount = 0;

  void incrementCount() {
    setState(() {
      itemCount++;
    });
  }

  void decrementCount() {
    if (itemCount > 0) {
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: decrementCount,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Text(
          ' $itemCount',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: incrementCount,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            if (itemCount > 0) {
              setState(() {
                itemCount = 0;
              });
            }
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


