class WishlistModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final bool wishlist;

  WishlistModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.wishlist,
  });

  factory WishlistModel.fromMap(Map<String, dynamic> map) {
    return WishlistModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      wishlist: map['wishlist'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'wishlist': wishlist,
    };
  }
}
