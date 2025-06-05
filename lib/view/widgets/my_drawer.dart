import 'package:e_commerce/view/screens/profile_screen.dart';
import 'package:e_commerce/view/screens/review_cart.dart';
import 'package:e_commerce/view/screens/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
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
                ),
                child: Center(
                  child: Text(
                    'Vegi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                children: [
                  Text(
                    'Welcome Guest',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          ListTile(leading: Icon(Icons.home_outlined), title: Text('Home')),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewCart()),
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
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WishlistScreen()));
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
