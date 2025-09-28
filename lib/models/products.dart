class Product {
  final String title;
  final String subtitle;
  final double price;
  final double rating;
  final String image;
  final String category;
  final String description;

  Product({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.image,
    required this.category,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'rating': rating,
      'image': image,
      'category': category,
      'description': description,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      subtitle: json['subtitle'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image'],
      category: json['category'],
      description: json['description'],
    );
  }
}

final List<Product> demoProducts = [
  Product(
    title: 'Flat White',
    subtitle: 'Espresso',
    price: 3.53,
    rating: 4.8,
    image: 'assets/product1.png',
    category: 'Latte',
    description:
    "A flat white is a coffee drink made with a shot of espresso and a thin layer of velvety microfoam. "
        "It has a stronger coffee-to-milk ratio than a latte, giving it a bold flavor while remaining smooth and creamy.",
  ),
  Product(
    title: 'Caffe Mocha',
    subtitle: 'Chocolate',
    price: 4.25,
    rating: 4.6,
    image: 'assets/product1.png',
    category: 'Machiato',
    description:
    "A caffe mocha is a delightful blend of espresso, steamed milk, and rich chocolate syrup. "
        "It balances the boldness of coffee with the sweetness of chocolate, often topped with whipped cream for extra indulgence.",
  ),
  Product(
    title: 'Americano',
    subtitle: 'Black',
    price: 2.80,
    rating: 4.4,
    image: 'assets/product1.png',
    category: 'Americano',
    description:
    "An Americano is made by diluting a shot of espresso with hot water, giving it a similar strength to drip coffee but with a different flavor profile. "
        "It’s smooth, simple, and perfect for those who enjoy a pure coffee taste.",
  ),
  Product(
    title: 'Cappuccino',
    subtitle: 'Foam',
    price: 3.75,
    rating: 4.5,
    image: 'assets/product1.png',
    category: 'Latte',
    description:
    "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk foam. "
        "This results in a stronger coffee flavor compared to a latte, due to the smaller amount of milk. "
        "The milk foam also helps keep the drink warm, making it a favorite choice for those who love a rich and balanced coffee experience.",
  ),
  Product(
    title: 'Espresso',
    subtitle: 'Strong',
    price: 2.50,
    rating: 4.3,
    image: 'assets/product1.png',
    category: 'Espresso',
    description:
    "Espresso is a concentrated form of coffee served in small, strong shots. "
        "It is the foundation of many coffee drinks and is loved for its bold flavor, rich aroma, and smooth crema.",
  ),
  Product(
    title: 'Iced Latte',
    subtitle: 'Cold',
    price: 4.10,
    rating: 4.7,
    image: 'assets/product1.png',
    category: 'Latte',
    description:
    "An iced latte is a refreshing drink made with chilled espresso poured over ice and topped with cold milk. "
        "It’s light, smooth, and perfect for warm weather, delivering a creamy yet caffeinated boost.",
  ),
  Product(
    title: 'Machiato',
    subtitle: 'Sweet',
    price: 3.95,
    rating: 4.6,
    image: 'assets/product1.png',
    category: 'Machiato',
    description:
    "A machiato is an espresso-based drink that is ‘stained’ with a small amount of milk or foam. "
        "It retains the intensity of espresso while softening the edges with a hint of creaminess, making it a bold yet balanced choice.",
  ),
];
