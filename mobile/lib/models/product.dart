class Product {
  int id;
  String name;
  String imgUrl;

  Product({required this.id, required this.name, required this.imgUrl});

  // Named constructor to create a Product from JSON data
  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imgUrl = json['img_url'];

  // Convert our Product to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'img_url': imgUrl, // Use 'img_url' instead of 'imgUrl' for consistency
      };
}
