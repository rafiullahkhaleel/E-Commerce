import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/models/cat-model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SaveCartDataProvider extends ChangeNotifier {
  Future<void> saveData(
    String id,
    String name,
    String image,
    String price,
    String quantity,
  ) async {
    try{
      CartModel newData = CartModel(
        id: id,
        name: name,
        image: image,
        price: price,
        quantity: quantity,
      );
      await FirebaseFirestore.instance
          .collection('cartData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('YourCartData')
          .doc(id)
          .set(newData.toMap());
    }catch(e){
      print('❌❌ $e');
    }
  }
}
