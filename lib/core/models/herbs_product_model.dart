class HerbsProductModel {
  final String name;
  final String image;
  final String price;

  HerbsProductModel({
    required this.name,
    required this.image,
    required this.price,
  });

  factory HerbsProductModel.fromMap(Map<String, dynamic> map) {
    return HerbsProductModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
    );
  }
}
