class CartModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final String quantity;
  final String unit;         // ✅ نیا فیلڈ
  final bool isAdd;

  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.unit,       // ✅ کنسٹرکٹر میں شامل
    required this.isAdd,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      quantity: map['quantity'] ?? '',
      unit: map['unit'] ?? '',            // ✅ fromMap میں شامل
      isAdd: map['isAdd'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'unit': unit,                      // ✅ toMap میں شامل
      'isAdd': isAdd,
    };
  }
}
