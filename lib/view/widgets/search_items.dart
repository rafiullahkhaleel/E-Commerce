import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchItems extends StatelessWidget {
  final bool isBool;
  final String image;
  final String name;
  final String price;
  final String? quantity;
  final VoidCallback? onDelete;
  const SearchItems({
    super.key,
    this.isBool = false,
    required this.image,
    required this.name,
    required this.price,
    this.onDelete,
    this.quantity,
  });

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
              child: Image.network(image),
            ),
          ),
          SizedBox(width: 15),
          SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text('50\$/50 Gram', style: TextStyle(fontSize: 15)),
                Spacer(),
                isBool == true
                    ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 35,

                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(price, style: TextStyle(fontSize: 15)),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    )
                    : Text(price, style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            height: 100,
            width: 120,
            child:
                isBool == true
                    ? Column(
                      children: [
                        Spacer(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: AppColors.primaryColor),
                              Text(
                                'ADD',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            showDeleteConfirmationDialog(
                              context: context,
                              onDelete: onDelete!,
                            );
                          },
                          child: Icon(Icons.delete, size: 30),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.remove,
                                  color: Color(0xffd6b738),
                                ),
                              ),
                              Text(
                                quantity ?? '1',
                                style: TextStyle(
                                  color: Color(0xffd6b738),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xffd6b738),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
          "Are you sure you want to delete this item?\nThis action cannot be undone!",
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
