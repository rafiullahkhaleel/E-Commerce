import 'package:e_commerce/view/widgets/my_drawer.dart';
import 'package:e_commerce/view/widgets/single_product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffd6b738),
        title: Text('Home'),
        actions: [
          CircleAvatar(
            backgroundColor: Color(0xFFd4d181),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              backgroundColor: Color(0xFFd4d181),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/vegetables.jfif'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Color(0xffd6b738),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Vegi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Herbs Seasonings', style: TextStyle(fontSize: 15)),
                Text(
                  'View all',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProduct(),
                  SingleProduct(),
                  SingleProduct(),
                  SingleProduct(),
                  SingleProduct(),
                  SingleProduct(),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fresh Fruits', style: TextStyle(fontSize: 15)),
                Text(
                  'View all',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProduct(),
                  SingleProduct(),
                  SingleProduct(),
                  SingleProduct(),
                  SingleProduct(),
                  SingleProduct(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
