import 'package:e_commerce/view/widgets/count.dart';
import 'package:flutter/material.dart';

import 'unit.dart';

class SingleProduct extends StatelessWidget {
  final String imageURL;
  final String name;
  final String price;
  final String id;
  final VoidCallback? onTap;
  final  List<String> unitsList;
  const SingleProduct({
    super.key,
    required this.imageURL,
    required this.name,
    this.onTap,
    required this.price,
    required this.id, required this.unitsList,
  });

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
          spacing: 5,
          children: [
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageURL),
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
                      name,
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
                                unitsList: unitsList,
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Count(
                             //   isAdd: isAdd,
                                imageURL: imageURL,
                                name: name,
                                price: price,
                                id: id,
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
