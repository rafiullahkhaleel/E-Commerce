
class ProductModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final List<String> units;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.units = const [],
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      units: List<String>.from(map['units'] ?? []), // ✅ Handle list safely
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'units': units,
    };
  }
}


















// class ProductModel {
//   final String id;
//   final String name;
//   final String image;
//   final String price;
//
//   ProductModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.price,
//   });
//
//   factory ProductModel.fromMap(Map<String, dynamic> map) {
//     return ProductModel(
//       id: map['id'] ?? '',
//       name: map['name'] ?? '',
//       image: map['image'] ?? '',
//       price: map['price'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'image': image,
//       'price': price,
//     };
//   }
// }
//
