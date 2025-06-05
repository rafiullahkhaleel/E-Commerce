import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/models/wishlist_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FetchWishlistDataProvider extends ChangeNotifier {
  List<WishlistModel> _snapshot = [];
  bool _isLoading = false;
  String? _error;
  List<WishlistModel> get snapshot => _snapshot;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Future<void> fetchData() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      final data =
      await FirebaseFirestore.instance
          .collection('wishlistData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('YourWishlistData')
          .get();

      _snapshot =
          data.docs.map((docs) {
            return WishlistModel.fromMap(docs.data());
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
        .collection('wishlistData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourWishlistData')
        .doc(id).delete();
    _snapshot.removeWhere((docs){
      return docs.id == id;
    });
    notifyListeners();
  }
}
