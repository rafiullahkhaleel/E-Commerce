import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../models/wishlist_model.dart';

class SaveWishlistDataProvider extends ChangeNotifier {
  Future<void> saveData({
    required String id,
    required String name,
    required String image,
    required String price,
  }) async {
    try {
      WishlistModel newData = WishlistModel(
        id: id,
        name: name,
        image: image,
        price: price,
        isWishlist: true,
      );
      await FirebaseFirestore.instance
          .collection('wishlistData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('YourWishlistData')
          .doc(id)
          .set(newData.toMap());
    } catch (e) {
      print('❌❌ $e');
    }
  }
}
