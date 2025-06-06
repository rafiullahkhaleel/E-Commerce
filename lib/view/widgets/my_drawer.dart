import 'package:e_commerce/core/providers/user_provider/user_data_provider.dart';
import 'package:e_commerce/view/screens/profile_screen.dart';
import 'package:e_commerce/view/screens/review_cart_cart.dart';
import 'package:e_commerce/view/screens/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    FetchUserDataProvider provider = Provider.of<FetchUserDataProvider>(
      context,
    );
    return Drawer(
      backgroundColor: Color(0xffd6b738),
      child: ListView(
        children: [
          Row(
            children: [
              SizedBox(width: 15),
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3, color: Color(0xFFd4d181)),
                  image: DecorationImage(
                    image: NetworkImage(provider.userData!.image),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.userData!.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      provider.userData!.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ListTile(leading: Icon(Icons.home_outlined), title: Text('Home')),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewCartScreen()),
              );
            },
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text('Review Cart'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            leading: Icon(Icons.person_outline_sharp),
            title: Text('My Profile'),
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined),
            title: Text('Notification'),
          ),
          ListTile(
            leading: Icon(Icons.star_border),
            title: Text('Rating & Review'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistScreen()),
              );
            },
            leading: Icon(Icons.favorite_border),
            title: Text('Wishlist'),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.doc_chart),
            title: Text('Raise a Complaint'),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.doc_on_doc),
            title: Text('FAQs'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  'Contacts Support',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Row(
                  children: [
                    Text("Call us:    ", style: TextStyle(fontSize: 15)),
                    Text(
                      '+923139126361',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Mail us:    ", style: TextStyle(fontSize: 15)),
                    Text(
                      'hello@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
