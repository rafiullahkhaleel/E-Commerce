import 'package:flutter/material.dart';

class OrderedItem extends StatelessWidget {
  const OrderedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network('https://greengardens.pk/wp-content/uploads/2023/07/1000015570.jpg',width: 60,),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Food name'),
          Text('50Gram'),
          Text('50\$'),
        ],
      ),
      subtitle: Text('5'),
    );
  }
}
