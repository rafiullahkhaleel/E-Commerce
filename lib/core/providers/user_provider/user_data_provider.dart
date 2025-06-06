import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model.dart';

class FetchUserDataProvider extends ChangeNotifier {
  UserModel? _userData;
  bool _isLoading = false;
  String? _error;

  UserModel? get userData => _userData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        _error = 'User not logged in.';
        _isLoading = false;
        notifyListeners();
        return;
      }

      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (docSnapshot.exists && docSnapshot.data() != null) {
        _userData = UserModel.fromMap(docSnapshot.data()!);
      } else {
        _error = 'User data not found.';
      }
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}










// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce/core/models/product_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../../models/user_model.dart';
//
// class FetchUserDataProvider extends ChangeNotifier {
//   List<UserModel> _snapshot = [];
//   bool _isLoading = false;
//   String? _error;
//   List<UserModel> get snapshot => _snapshot;
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//   Future<void> fetchData() async {
//     try {
//       _isLoading = true;
//       _error = null;
//       notifyListeners();
//       final data =
//           await FirebaseFirestore.instance
//               .collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
//               .get();
//       _snapshot = [UserModel.fromMap(data.data()!)];
//
//       // _snapshot =
//       //     data.docs.map((docs) {
//       //       return UserModel.fromMap(docs.data());
//       //     }).toList();
//       notifyListeners();
//     } catch (e) {
//       print('<<<<<<<<<<<<<<<<<<<<<<<<<<$e>>>>>>>>>>>>>>>>>>>>>>>>>>>> ');
//       _isLoading = false;
//       _error = e.toString();
//       notifyListeners();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
