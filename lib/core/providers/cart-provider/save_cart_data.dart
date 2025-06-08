import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SaveCartDataProvider extends ChangeNotifier {
  Future<void> saveData({
    required String id,
    required String name,
    required String image,
    required String price,
    required String quantity,
    required String selectedUnit
  }) async {
    try {
      CartModel newData = CartModel(
        unit: selectedUnit,
        id: id,
        name: name,
        image: image,
        price: price,
        quantity: quantity,
        isAdd: true,
      );
      await FirebaseFirestore.instance
          .collection('cartData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('YourCartData')
          .doc(id)
          .set(newData.toMap());
    } catch (e) {
      print('❌❌ $e');
    }
  }

  Future<void> updateQuantity({required String quantity,required String id}) async {
    try {
      await FirebaseFirestore.instance
          .collection('cartData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('YourCartData')
          .doc(id)
          .update({
        'quantity' : quantity
      });
    } catch (e) {
      print('❌❌ $e');
    }
  }

  Future<void> updateUnit({required String unit,required String id}) async {
    try {
      await FirebaseFirestore.instance
          .collection('cartData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('YourCartData')
          .doc(id)
          .update({
        'unit' : unit
      });
    } catch (e) {
      print('❌❌ $e');
    }
  }
}
