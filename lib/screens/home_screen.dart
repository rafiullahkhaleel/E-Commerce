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
      drawer: Drawer(),
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
        child: Column(
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
                    color: Colors.yellow.shade600,
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
          ],
        ),
      ),
    );
  }
}
