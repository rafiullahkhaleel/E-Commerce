import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/models/product_model.dart';
import 'package:e_commerce/core/providers/cart-provider/fetch_cart_data_provider.dart';
import 'package:e_commerce/core/providers/fresh_fruit_provider.dart';
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
      Provider.of<FreshFruitProductProvider>(
        context,
        listen: false,
      ).fetchData();
      Provider.of<FetchCartDataProvider>(context, listen: false).fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<FetchCartDataProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Home'),
        actions: [
          Consumer<FreshFruitProductProvider>(
            builder: (context, provider, child) {
              return Visibility(
                visible: !provider.isLoading,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFd4d181),
                  child: IconButton(
                    onPressed: () {
                      List<ProductModel> herbProvider =
                          Provider.of<HerbsProductProvider>(
                            context,
                            listen: false,
                          ).snapshot;
                      List<ProductModel> fruitProvider =
                          Provider.of<FreshFruitProductProvider>(
                            context,
                            listen: false,
                          ).snapshot;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => SearchScreen(
                                searchList: [...herbProvider, ...fruitProvider],
                              ),
                        ),
                      );
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              );
            },
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
                      bottomLeft: Radius.circular(15),
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
                Consumer<HerbsProductProvider>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    SearchScreen(searchList: provider.snapshot),
                          ),
                        );
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Consumer<HerbsProductProvider>(
              builder: (context, provider, child) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:
                      provider.isLoading
                          ? Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 2.2,
                              ),
                              SizedBox(
                                height: 250,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ],
                          )
                          : provider.error != null
                          ? Center(
                            child: Text('ERROR OCCURRED ${provider.error}'),
                          )
                          : Row(
                            children:
                                provider.snapshot.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  var element = entry.value;

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
                                    id: element.id,
                                    // isAdd: providerData.snapshot.length > index
                                    //     ? providerData.snapshot[index].isAdd
                                    //     : false,
                                  );
                                }).toList(),
                          ),
                );
              },
            ),

            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fresh Fruits', style: TextStyle(fontSize: 15)),
                Consumer<FreshFruitProductProvider>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    SearchScreen(searchList: provider.snapshot),
                          ),
                        );
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Consumer<FreshFruitProductProvider>(
              builder: (context, provider, child) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:
                      provider.isLoading
                          ? Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 2.2,
                              ),
                              SizedBox(
                                height: 250,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ],
                          )
                          : provider.error != null
                          ? Center(
                            child: Text('ERROR OCCURRED ${provider.error}'),
                          )
                          : Row(
                            children:
                                provider.snapshot.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  var element = entry.value;

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
                                    id: element.id,
                                    // isAdd: providerData.snapshot.length > index
                                    //     ? providerData.snapshot[index].isAdd
                                    //     : false,
                                  );
                                }).toList(),
                          ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Consumer<HerbsProductProvider>(
// builder: (context, provider, child) {
// return SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child:
// provider.isLoading
// ? Row(
// children: [
// SizedBox(
// width: MediaQuery.sizeOf(context).width / 2.2,
// ),
// SizedBox(
// height: 250,
// child: Center(
// child: CircularProgressIndicator(),
// ),
// ),
// ],
// )
//     : provider.error != null
// ? Center(
// child: Text('ERROR OCCURRED ${provider.error}'),
// )
//     : Row(
// children:
// provider.snapshot.map((element) {
// return SingleProduct(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder:
// (context) => DetailScreen(
// imageUrl: element.image,
// name: element.name,
// price: element.price,
// ),
// ),
// );
// },
// imageURL: element.image,
// name: element.name,
// price: element.price,
// id: element.id,
// isAdd: providerData.snapshot[0].isAdd
// );
// }).toList(),
// ),
// );
// },
// ),

// Consumer<FreshFruitProductProvider>(
// builder: (context, provider, child) {
// return SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child:
// provider.isLoading
// ? Row(
// children: [
// SizedBox(
// width: MediaQuery.sizeOf(context).width / 2.2,
// ),
// SizedBox(
// height: 250,
// child: Center(
// child: CircularProgressIndicator(),
// ),
// ),
// ],
// )
//     : provider.error != null
// ? Center(
// child: Text('ERROR OCCURRED ${provider.error}'),
// )
//     : Row(
// children:
// provider.snapshot.map((element) {
// return SingleProduct(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder:
// (context) => DetailScreen(
// imageUrl: element.image,
// name: element.name,
// price: element.price,
// ),
// ),
// );
// },
// imageURL: element.image,
// name: element.name,
// price: element.price,
// id: element.id,
// );
// }).toList(),
// ),
// );
// },
// ),
