import 'package:e_commerce/core/providers/cart-provider/save_cart_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  final String imageURL;
  final String name;
  final String price;
  final String id;
  const Count({
    super.key,
    required this.imageURL,
    required this.name,
    required this.price, required this.id,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaveCartDataProvider>(context,listen: false);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isTrue == true
              ? Row(
                mainAxisAlignment:
                    count < 10
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (count > 1) {
                        setState(() {
                          count--;
                        });
                        return;
                      }
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                      }
                    },
                    child: Icon(Icons.remove, color: Color(0xffd6b738)),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                      color: Color(0xffd6b738),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap:
                        count == 100 || count > 100
                            ? null
                            : () {
                              setState(() {
                                count++;
                              });
                            },
                    child: Icon(Icons.add, color: Color(0xffd6b738)),
                  ),
                ],
              )
              : InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  provider.saveData(
                    widget.id,
                    widget.name,
                    widget.imageURL,
                    widget.price,
                    count.toString(),
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
              ),
        ],
      ),
    );
  }
}
