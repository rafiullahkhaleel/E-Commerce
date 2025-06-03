import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/models/herbs_product_model.dart';
import 'package:flutter/cupertino.dart';

class HerbsProductProvider extends ChangeNotifier{
  List<HerbsProductModel> _snapshot = [];
  bool _isLoading = false;
  String? _error;
   List<HerbsProductModel> get snapshot => _snapshot;
   bool get isLoading => _isLoading;
   String? get error => _error;

   Future<void> fetchData()async{
     try{
       _isLoading = true;
       _error = null;
       notifyListeners();
       final data = await FirebaseFirestore.instance.collection('herbsProducts').get();

       _snapshot = data.docs.map((docs){
         print(docs);
         return HerbsProductModel.fromMap(docs.data());
       }).toList();
       notifyListeners();
     }catch(e){
       print('errrrrrrrrrrrrrrroor $e');
       _isLoading = false;
       _error = e.toString();
       notifyListeners();
     }finally{
       _isLoading = false;
       notifyListeners();
     }
   }

}