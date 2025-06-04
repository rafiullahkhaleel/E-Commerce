class CartModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final String quantity;

  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  // Convert Firestore Document to Dart Object
  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      quantity: map['quantity'] ?? '',
    );
  }

  // Convert Dart Object to Firestore Format
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }
}
