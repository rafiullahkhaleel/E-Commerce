class UserModel {
  final String name;
  final String email;
  final String image;

  UserModel({
    required this.name,
    required this.email,
    required this.image,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
