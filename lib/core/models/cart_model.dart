class CartModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final String quantity;
  final bool isAdd;

  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.isAdd,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      quantity: map['quantity'] ?? '',
      isAdd: map['isAdd'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'isAdd': isAdd,
    };
  }
}
