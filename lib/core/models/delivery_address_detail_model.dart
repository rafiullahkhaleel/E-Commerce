class DeliveryAddressModel {
  final String firstName;
  final String lastName;
  final String mobileNo;
  final String alternateMobileNo;
  final String society;
  final String street;
  final String landmark;
  final String city;
  final String area;
  final String pincode;
  final String address;
  final double latitude;
  final double longitude;

  DeliveryAddressModel({
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.alternateMobileNo,
    required this.society,
    required this.street,
    required this.landmark,
    required this.city,
    required this.area,
    required this.pincode,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  /// Firestore سے ڈیٹا لینے کے لیے
  factory DeliveryAddressModel.fromMap(Map<String, dynamic> map) {
    return DeliveryAddressModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      mobileNo: map['mobileNo'] ?? '',
      alternateMobileNo: map['alternateMobileNo'] ?? '',
      society: map['society'] ?? '',
      street: map['street'] ?? '',
      landmark: map['landmark'] ?? '',
      city: map['city'] ?? '',
      area: map['area'] ?? '',
      pincode: map['pincode'] ?? '',
      address: map['address'] ?? '',
      latitude: (map['latitude'] ?? 0).toDouble(),
      longitude: (map['longitude'] ?? 0).toDouble(),
    );
  }
}
