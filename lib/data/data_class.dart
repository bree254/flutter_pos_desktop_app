const MenuItems = [
 'All Items',
  'Food',
  'Alcohol',
  'Cold Drinks',
  'Hot Drinks'
];
class Products {
 final String title;
 final String quantity;
 final String price;
 final String imageurl;

 const Products({
  required this.title,
  required this.quantity,
  required this.price,
  required this.imageurl,

 });
}
const productItems = [
 Products(
     title: 'Grilled Corn',
     quantity: '150g',
     price: '\$7.75',
     imageurl: 'assets/mushroom_burger.png',
 ),
 Products(
  title: 'Ranch Burgers',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/ranch_burger.png',
 ),
 Products(
  title: 'Bacon Pizza',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/ranch_burger.png',
 ),
 Products(
  title: 'Fettuccine Pasta',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/icon-noodles.png',
 ),
 Products(
  title: 'Stuffed Flank Steak',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/ranch_burger.png',
 ),
 Products(
  title: 'Tortillas',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/ranch_burger.png',
 ),
 Products(
  title: 'Original Burgers',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/beef_burger.png',
 ),
 Products(
  title: 'Pancakes',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/icon-desserts.png',
 ),
 Products(
  title: 'Pepperoni Pizza',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/ranch_burger.png',
 ),
 Products(
  title: 'Pepperoni Pizza',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/ranch_burger.png',
 ),
 Products(
  title: 'Pepperoni Pizza',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/ranch_burger.png',
 ),
 Products(
  title: 'Pepperoni Pizza',
  quantity: '150g',
  price: '\$7.75',
  imageurl: 'assets/ranch_burger.png',
 )

];

