import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/cart-provider/save_cart_data.dart';

class Unit extends StatefulWidget {
  final List<String> unitsList;
  final String id;
  final ValueChanged<String> onUnitChanged;

  const Unit({
    super.key,
    required this.unitsList,
    required this.id,
    required this.onUnitChanged,
  });

  @override
  State<Unit> createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  bool isRestart = true;
  String selectedUnit = '';

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.unitsList.first;
    widget.onUnitChanged(selectedUnit);
    Provider.of<SaveCartDataProvid>(context, listen: false)
        .listenToUnit(widget.id);// ✅ first time notify parent
  }

  @override
  Widget build(BuildContext context) {
    final provid = Provider.of<SaveCartDataProvid>(context);
    final currentUnit = provid.getUnit(widget.id).isNotEmpty
        ? provid.getUnit(widget.id)
        : selectedUnit;
    final provider = Provider.of<SaveCartDataProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          backgroundColor: Colors.white,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  ...widget.unitsList.map((data) {
                    return ListTile(
                      title: Text(
                        data,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          selectedUnit = data;
                          provider.updateUnit(
                            unit: selectedUnit,
                            id: widget.id,
                          );
                        });
                        widget.onUnitChanged(selectedUnit); // ✅ notify parent
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade600),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    currentUnit,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13),
                  )
                ),
                Icon(Icons.arrow_drop_down, color: Color(0xffd6b738)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class SaveCartDataProvid with ChangeNotifier {
  Map<String, String> _productUnits = {};

  String getUnit(String productId) {
    return _productUnits[productId] ?? '';
  }

  void listenToUnit(String productId) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance
        .collection('cartData')
        .doc(uid)
        .collection('YourCartData')
        .doc(productId)
        .snapshots()
        .listen((doc) {
      if (doc.exists && doc.data()!.containsKey('unit')) {
        _productUnits[productId] = doc['unit'];
        notifyListeners();
      }
    });
  }
}



// StreamBuilder<DocumentSnapshot>(
// stream:
// FirebaseFirestore.instance
//     .collection('cartData')
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('YourCartData')
//     .doc(widget.id)
//     .snapshots(),
// builder: (context, snapshot) {
// final doc = snapshot.data;
// final String quantityString =
// (doc != null && doc.exists)
// ? doc.get('unit')
//     : selectedUnit;
//
// return Text(
// quantityString,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(fontSize: 13),
// );
// },
// ),