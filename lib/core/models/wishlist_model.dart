class WishlistModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final bool isWishlist;

  WishlistModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.isWishlist,
  });

  factory WishlistModel.fromMap(Map<String, dynamic> map) {
    return WishlistModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      isWishlist: map['isWishlist'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'isWishlist': isWishlist,
    };
  }
}
