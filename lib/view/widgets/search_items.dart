import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchItems extends StatelessWidget {
  final bool isBool;
  final String image;
  final String name;
  final String price;
  const SearchItems({
    super.key,
    this.isBool = false,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
                color: Colors.green,
                height: 90,width: 90, child: Image.network(image)),
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
                        Icon(Icons.delete, size: 30),
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
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
