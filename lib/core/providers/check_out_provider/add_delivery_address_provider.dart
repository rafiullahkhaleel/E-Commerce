import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddDeliveryAddressProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController alternateMobileNoController = TextEditingController();
  TextEditingController societyController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  bool isLoading = false;

  void saveData(context, addressType) async {
    isLoading = true;
    notifyListeners();
    try {
      await FirebaseFirestore.instance
          .collection('deliveryData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
            'firstName': firstNameController.text,
            'lastName': lastNameController.text,
            'mobileNo': mobileNoController.text,
            'alternateMobileNo': alternateMobileNoController.text,
            'society': societyController.text,
            'street': streetController.text,
            'landmark': landMarkController.text,
            'city': cityController.text,
            'area': areaController.text,
            'pincode': pincodeController.text,
            'address': addressType.toString().split('.').last,
          })
          .then((val) {
            isLoading = false;
            notifyListeners();
            Navigator.of(context).pop();
          });
    } catch (e) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('ERROR OCCURRED $e')));
    }
  }
}
