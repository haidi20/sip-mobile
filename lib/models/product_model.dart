class ProductModel {
  int id;
  String name;
  String imgUrl;

  ProductModel({required this.id, required this.name, required this.imgUrl});

  // Create a ProductModel from JSON data
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        imgUrl: json['imgUrl'],
      );

  // Convert our ProductModel to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imgUrl': imgUrl,
      };
}
