import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/providers/wishlist_provider/fetch_wishlist_data.dart';
import 'package:e_commerce/core/providers/wishlist_provider/save_wishlist_data.dart';
import 'package:e_commerce/view/screens/review_cart_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/count.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String price;
  final String id;
  const DetailScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    SaveWishlistDataProvider saveProvider = Provider.of(context);
    FetchWishlistDataProvider provider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        widget.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('50\$'),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          height: MediaQuery.of(context).size.height * .3,
                          widget.imageUrl,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Available Options',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.green,
                            ),
                            Radio(
                              value: '',
                              groupValue: '',
                              onChanged: (value) {},
                              focusColor: Colors.green,
                            ),
                          ],
                        ),
                        Text(
                          '${widget.price}\$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          height: 37,
                          width: 90,

                          decoration: BoxDecoration(
                            color: Colors.white60,
                            border: Border.all(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Count(
                            //   isAdd: isAdd,
                            imageURL: widget.imageUrl,
                            name: widget.name,
                            price: widget.price,
                            id: widget.id,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About This Product',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Product diagnostics improve the quality of your product data by providing insights on which products can show in ads and which can’t,helping to make it easier to determine which products need your attention. These statuses are available at the account, campaign,asset, and ad group levels. This article explains the possible product statuses that may appear, what they mean, and how to address them.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream:
                  FirebaseFirestore.instance
                      .collection('wishlistData')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('YourWishlistData')
                      .doc(widget.id)
                      .snapshots(),
              builder: (context, snapshot) {
                final doc = snapshot.data;
                final bool isFavourite =
                    (doc != null && doc.exists) ? doc.get('isWishlist') : false;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(height: 25, width: 25, child: Container());
                } else if (snapshot.hasError || !snapshot.hasData) {
                  return const Icon(Icons.error, color: Colors.red);
                } else {
                  return Bottom(
                    onTap: () {
                      if (!isFavourite) {
                        saveProvider.saveData(
                          id: widget.id,
                          name: widget.name,
                          image: widget.imageUrl,
                          price: widget.price,
                        );
                      } else {
                        provider.delete(widget.id);
                      }
                    },
                    icon: isFavourite ? Icons.favorite : Icons.favorite_border,
                    title: 'Add to Wishlist',
                    background: Colors.black,
                  );
                }
              },
            ),

            Bottom(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ReviewCartScreen()),
                );
              },
              icon: Icons.shopping_bag_outlined,
              title: 'Go to Cart',
              background: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  final Color background;
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  const Bottom({
    super.key,
    required this.background,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: background,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
