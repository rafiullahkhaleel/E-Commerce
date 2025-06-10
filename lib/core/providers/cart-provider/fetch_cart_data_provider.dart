import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FetchCartDataProvider extends ChangeNotifier {
  List<CartModel> _snapshot = [];
  bool _isLoading = false;
  String? _error;
  List<CartModel> get snapshot => _snapshot;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Future<void> fetchData() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      final data =
          await FirebaseFirestore.instance
              .collection('cartData')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('YourCartData')
              .get();

      _snapshot =
          data.docs.map((docs) {
            print(docs);
            return CartModel.fromMap(docs.data());
          }).toList();
      notifyListeners();
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

  Future<void> delete(String id) async {
    FirebaseFirestore.instance
        .collection('cartData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourCartData')
        .doc(id)
        .delete();
    _snapshot.removeWhere((docs) {
      return docs.id == id;
    });
    notifyListeners();
  }

  double getTotal() {
    double total = 0.0;
    _snapshot.forEach((data) {
      total += double.parse(data.price) * double.parse(data.quantity);
    });
    return total;
  }
}
