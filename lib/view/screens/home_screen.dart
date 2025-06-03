import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/providers/herbs_product_provider.dart';
import 'package:e_commerce/view/screens/detail/detial_screen.dart';
import 'package:e_commerce/view/screens/search_screen.dart';
import 'package:e_commerce/view/widgets/my_drawer.dart';
import 'package:e_commerce/view/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<HerbsProductProvider>(context, listen: false).fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HerbsProductProvider>(
      builder: (context, provider, child) {
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  icon: Icon(Icons.search),
                ),
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
                  child:
                      provider.isLoading
                          ? Row(
                            children: [
                              SizedBox(width: MediaQuery.sizeOf(context).width/2.2,),
                              SizedBox(
                                height: 250,
                                child: Center(child: CircularProgressIndicator()),
                              ),
                            ],
                          )
                          : provider.error != null
                          ? Center(
                            child: Text('ERROR OCCURRED ${provider.error}'),
                          )
                          : Row(
                            children:
                                provider.snapshot.map((element) {
                                  return SingleProduct(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => DetailScreen(
                                                imageUrl: element.image,
                                                name: element.name,
                                                price: element.price,
                                              ),
                                        ),
                                      );
                                    },
                                    imageURL: element.image,
                                    name: element.name,
                                    price: element.price,
                                  );
                                }).toList(),
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
                        price: '',
                        imageURL:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzVlSssPqPdbLKN-96RWzVpla2_wUv_pzVdg&s',
                        name: 'Grapes',
                      ),
                      SingleProduct(
                        price: '',
                        imageURL:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYyB9ZbwPxnDJ1kyGUjCbBZ6JlBO8tWZ5NCw&s',
                        name: 'Water Melon',
                      ),
                      SingleProduct(
                        price: '',
                        imageURL:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9L-6Bzo3zTDef1fJ1-UTvAsdbXj4_wPt_w&s',
                        name: 'Apple',
                      ),
                      SingleProduct(
                        price: '',
                        imageURL:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9xl39KJGbHwEhO_lpbJ5Y3Vhk_JoLBDlMPg&s',
                        name: 'Mango',
                      ),
                      SingleProduct(
                        price: '',
                        imageURL:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAPTmLmy6JOANUgSeOSVv0Y7d5izTO_wsWLQ&s',
                        name: 'Banana',
                      ),
                      SingleProduct(
                        price: '',
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
      },
    );
  }
}
