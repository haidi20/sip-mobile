class Product {
  int id;
  String name;
  String imgUrl;
  String price;

  Product(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.price});

  // Named constructor to create a Product from JSON data
  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imgUrl = json['img_url'],
        price = json['price'];

  // Convert our Product to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'img_url': imgUrl,
        'price': price,
      };
}
