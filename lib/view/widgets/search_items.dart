import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/view/widgets/count.dart';
import 'package:e_commerce/view/widgets/unit.dart';
import 'package:flutter/material.dart';

class SearchItems extends StatefulWidget {
  final bool isBool;
  final String image;
  final String name;
  final String price;
  final String? quantity;

  final VoidCallback? onDelete;
  final bool isReviewCart;
  final String? id;
  final List<String>? unitsList;
  const SearchItems({
    super.key,
    this.isBool = false,
    this.isReviewCart = false,
    required this.image,
    required this.name,
    required this.price,
    this.onDelete,
    this.quantity,
    this.id,
    this.unitsList,
  });

  @override
  State<SearchItems> createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItems> {
  String selectedUnit = ''; // ✅ store unit locally

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.unitsList?.first ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: Colors.green,
              height: 90,
              width: 90,
              child: Image.network(widget.image),
            ),
          ),
          SizedBox(width: 15),
          SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text('${widget.price}\$/50 Gram', style: TextStyle(fontSize: 15)),
                SizedBox(height: 7,),
                widget.isBool == true
                ? Expanded(
                  child: Unit(
                    unitsList: widget.unitsList ?? [],
                    id: widget.id!,
                    onUnitChanged: (value) {
                      selectedUnit = value;
                    },),
                )
                    : Text(widget.price, style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            height: 100,
            width: 120,
            child:
                widget.isBool == true
                    ? Column(
                      children: [
                        Spacer(),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            border: Border.all(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Count(
                            selectedUnit: selectedUnit,
                            imageURL: widget.image,
                            name: widget.name,
                            price: widget.price,
                            id: widget.id!,
                          ),
                        ),
                        Spacer(),
                      ],
                    )
                    : widget.isReviewCart
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            showDeleteConfirmationDialog(
                              context: context,
                              onDelete: widget.onDelete!,
                            );
                          },
                          child: Icon(Icons.delete, size: 30),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            border: Border.all(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Count(
                            selectedUnit: widget.price,
                            imageURL: widget.image,
                            name: widget.name,
                            price: widget.price,
                            id: widget.id!,
                          ),
                        ),
                      ],
                    )
                    : Center(
                      child: InkWell(
                        onTap: () {
                          showDeleteConfirmationDialog(
                            context: context,
                            onDelete: widget.onDelete!,
                          );
                        },
                        child: Icon(Icons.delete, size: 30),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}

Future<void> showDeleteConfirmationDialog({
  required BuildContext context,
  required VoidCallback onDelete,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
            SizedBox(width: 8),
            Text("Delete Item", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(
          "Are you sure you want to delete this item?",
          style: TextStyle(fontSize: 15),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel", style: TextStyle(color: Colors.grey[700])),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              onDelete(); // Call delete function
            },
            icon: Icon(Icons.delete, color: Colors.white),
            label: Text("Delete", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      );
    },
  );
}
