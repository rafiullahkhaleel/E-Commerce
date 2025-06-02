import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/view/screens/detail/detial_screen.dart';
import 'package:e_commerce/view/screens/search_screen.dart';
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
        backgroundColor: AppColors.primaryColor,
        title: Text('Home'),
        actions: [
          CircleAvatar(
            backgroundColor: Color(0xFFd4d181),
            child: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                },
                icon:Icon(Icons.search)),
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
                  SingleProduct(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailScreen(
                                imageUrl:
                                    'https://greengardens.pk/wp-content/uploads/2023/07/1000015570.jpg',
                                name: 'Fresh Basil',
                              ),
                        ),
                      );
                    },
                    imageURL:
                        'https://greengardens.pk/wp-content/uploads/2023/07/1000015570.jpg',
                    name: 'Fresh Basil',
                  ),
                  SingleProduct(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailScreen(
                            imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL-aExbxxr34tCr8RbkZVcGhbwB-c5bUsyqw&s',
                            name: 'Pepper',
                          ),
                        ),
                      );
                    },
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL-aExbxxr34tCr8RbkZVcGhbwB-c5bUsyqw&s',
                    name: 'Pepper',
                  ),
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSANPaGACfQBDqCRmOfvNOf8N_VIOvELt4R7g&s',
                    name: 'Green Onion',
                  ),
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuHYp-ZsQA0jJekJg7Zf1hTtcg3v7J0X4Z6w&s',
                    name: 'Okra',
                  ),
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmr_j0Et8C8vc0X5QeCalmsVflsh7GGLT6WA&s',
                    name: 'Mint',
                  ),
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy5HHBMBioaWXitTT-hqB8m05LbCjYB0YJfw&s',
                    name: 'Spinach',
                  ),
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
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzVlSssPqPdbLKN-96RWzVpla2_wUv_pzVdg&s',
                    name: 'Grapes',
                  ),
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYyB9ZbwPxnDJ1kyGUjCbBZ6JlBO8tWZ5NCw&s',
                    name: 'Water Melon',
                  ),
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9L-6Bzo3zTDef1fJ1-UTvAsdbXj4_wPt_w&s',
                    name: 'Apple',
                  ),
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9xl39KJGbHwEhO_lpbJ5Y3Vhk_JoLBDlMPg&s',
                    name: 'Mango',
                  ),
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAPTmLmy6JOANUgSeOSVv0Y7d5izTO_wsWLQ&s',
                    name: 'Banana',
                  ),
                  SingleProduct(
                    imageURL:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShDZibBehmTA9pQayLFU2USSAPr8MBVIhBdQ&s',
                    name: 'Orange',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
