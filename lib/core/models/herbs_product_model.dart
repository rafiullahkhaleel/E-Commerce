class ProductModel {
  final String name;
  final String image;
  final String price;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
    );
  }
}
