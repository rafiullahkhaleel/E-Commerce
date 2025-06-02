import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SerchItems extends StatelessWidget {
  const SerchItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 120,
                child: Image.network(
                  'https://greengardens.pk/wp-content/uploads/2023/07/1000015570.jpg',
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text(
                    'ProductName',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    '50\$/50 Gram',
                    style: TextStyle(fontSize: 15),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '50 Gram',
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
                  height: 100,
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: AppColors.primaryColor,),
                        Text('ADD',style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Spacer()
                ],
              ),
              )),
        ],
      ),
    );
  }
}
