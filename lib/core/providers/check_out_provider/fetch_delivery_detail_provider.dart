import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/models/delivery_address_detail_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/cart_model.dart';

class FetchDeliveryDetailProvider extends ChangeNotifier {
  DeliveryAddressModel? _deliveryAddressData;
  bool _isLoading = false;
  String? _error;
  DeliveryAddressModel? get deliveryAddressData => _deliveryAddressData;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Future<void> fetchData() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      final data =
          await FirebaseFirestore.instance
              .collection('deliveryData')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();
      if (data.exists && data.data() != null) {
        _deliveryAddressData = DeliveryAddressModel.fromMap(data.data()!);
      } else {
        _error = 'User data not found.';
      }
    } catch (e) {
      print('Error $e');
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
