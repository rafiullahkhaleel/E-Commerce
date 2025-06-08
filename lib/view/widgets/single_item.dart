import 'package:e_commerce/view/widgets/unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'count.dart';

class SingleProduct extends StatefulWidget {
  final String imageURL;
  final String name;
  final String price;
  final String id;
  final VoidCallback? onTap;
  final List<String> unitsList;
  final ValueChanged<String> onUnitChanged;

  const SingleProduct({
    super.key,
    required this.imageURL,
    required this.name,
    this.onTap,
    required this.price,
    required this.id,
    required this.unitsList, required this.onUnitChanged,
  });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  String selectedUnit = ''; // ✅ store unit locally

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.unitsList.first;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 250,
        width: 200,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: widget.onTap,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '50\$/50 Gram',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Unit(
                                unitsList: widget.unitsList,
                                id: widget.id,
                                onUnitChanged: (value) {
                                    selectedUnit = value;
                                    widget.onUnitChanged(value);// ✅ update state
                                },
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Count(
                                imageURL: widget.imageURL,
                                name: widget.name,
                                price: widget.price,
                                id: widget.id,
                                selectedUnit: selectedUnit, // ✅ pass to Count
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}