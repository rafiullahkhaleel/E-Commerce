import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/providers/cart-provider/fetch_cart_data_provider.dart';
import 'package:e_commerce/core/providers/cart-provider/save_cart_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  final String imageURL;
  final String name;
  final String price;
  final String id;
  final String selectedUnit;

  const Count({
    super.key,
    required this.imageURL,
    required this.name,
    required this.price,
    required this.id, required this.selectedUnit,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveCartDataProvider>(context, listen: false);
    final delete = Provider.of<FetchCartDataProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream:
                FirebaseFirestore.instance
                    .collection('cartData')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('YourCartData')
                    .doc(widget.id)
                    .snapshots(),
            builder: (context, snapshot) {
              final doc = snapshot.data;
              final bool currentValue =
                  (doc != null && doc.exists) ? doc.get('isAdd') : false;
              final String quantityString =
                  (doc != null && doc.exists) ? doc.get('quantity') : '1';

              if (snapshot.hasError || !snapshot.hasData) {
                return const Icon(Icons.error, color: Colors.red);
              } else {
                final int quantity = int.tryParse(quantityString) ?? 1;
                return currentValue
                    ? Row(
                      mainAxisAlignment:
                          quantity < 10
                              ? MainAxisAlignment.spaceEvenly
                              : MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            if (quantity > 1) {
                              provider.updateQuantity(
                                quantity: (quantity - 1).toString(),
                                id: widget.id,
                              );
                            } else if (quantity == 1) {
                              delete.delete(widget.id);
                            }
                          },
                          child: Icon(Icons.remove, color: Color(0xffd6b738)),
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(
                            color: Color(0xffd6b738),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        InkWell(
                          onTap:
                              quantity >= 100
                                  ? null
                                  : () {
                                    provider.updateQuantity(
                                      quantity: (quantity + 1).toString(),
                                      id: widget.id,
                                    );
                                  },
                          child: Icon(Icons.add, color: Color(0xffd6b738)),
                        ),
                      ],
                    )
                    : InkWell(
                      onTap: () {
                        provider.saveData(
                          selectedUnit: widget.selectedUnit,
                          id: widget.id,
                          name: widget.name,
                          image: widget.imageURL,
                          price: widget.price,
                          quantity: count.toString(),
                        );
                      },
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          color: Color(0xffd6b738),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce/core/providers/cart-provider/fetch_cart_data_provider.dart';
// import 'package:e_commerce/core/providers/cart-provider/save_cart_data.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class Count extends StatefulWidget {
//   final String imageURL;
//   final String name;
//   final String price;
//   final String id;
//
//   const Count({
//     super.key,
//     required this.imageURL,
//     required this.name,
//     required this.price,
//     required this.id,
//   });
//
//   @override
//   State<Count> createState() => _CountState();
// }
//
// class _CountState extends State<Count> {
//   int count = 1;
//   // bool isTrue = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<SaveCartDataProvider>(context, listen: false);
//     final delete = Provider.of<FetchCartDataProvider>(context, listen: false);
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade600),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           StreamBuilder<DocumentSnapshot>(
//             stream:
//                 FirebaseFirestore.instance
//                     .collection('cartData')
//                     .doc(FirebaseAuth.instance.currentUser!.uid)
//                     .collection('YourCartData')
//                     .doc(widget.id)
//                     .snapshots(),
//             builder: (context, snapshot) {
//               final doc = snapshot.data;
//               final bool currentValue =
//                   (doc != null && doc.exists) ? doc.get('isAdd') : false;
//               final String quantity =
//                   (doc != null && doc.exists) ? doc.get('quantity') : '1';
//               // if (snapshot.connectionState == ConnectionState.waiting) {
//               //   return SizedBox(
//               //     height: 25,
//               //       width: 25,
//               //       child:  Container());
//               // }else
//
//               if (snapshot.hasError || !snapshot.hasData) {
//                 return const Icon(Icons.error, color: Colors.red);
//               } else {
//                 return currentValue
//                     ? Row(
//                       mainAxisAlignment:
//                           count < 10
//                               ? MainAxisAlignment.spaceEvenly
//                               : MainAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             if (count > 1) {
//                               count--;
//                               provider.updateData(count.toString(), widget.id);
//                               return;
//                             }
//                             if (count == 1) {
//                               delete.delete(widget.id);
//                               // isTrue = false;
//                             }
//                           },
//                           child: Icon(Icons.remove, color: Color(0xffd6b738)),
//                         ),
//                         Text(
//                           '$quantity',
//                           style: TextStyle(
//                             color: Color(0xffd6b738),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           ),
//                         ),
//                         InkWell(
//                           onTap:
//                               count == 100 || count > 100
//                                   ? null
//                                   : () {
//                                     setState(() {
//                                       count++;
//                                       provider.updateData(
//                                         count.toString(),
//                                         widget.id,
//                                       );
//                                     });
//                                   },
//                           child: Icon(Icons.add, color: Color(0xffd6b738)),
//                         ),
//                       ],
//                     )
//                     : InkWell(
//                       onTap: () {
//                         provider.saveData(
//                           widget.id,
//                           widget.name,
//                           widget.imageURL,
//                           widget.price,
//                           count.toString(),
//                         );
//                       },
//                       child: Text(
//                         'ADD',
//                         style: TextStyle(
//                           color: Color(0xffd6b738),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                     );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
