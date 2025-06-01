import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Column(children: [
          Expanded(
            flex: 2,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Fresh Basil',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('50\$'),
                  ),
                  SizedBox(height: 20,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network('https://greengardens.pk/wp-content/uploads/2023/07/1000015570.jpg',
                    width: MediaQuery.of(context).size.width*.6,
                    ),
                  )
                ],
              ))]),
        bottomNavigationBar: Row(
          children: [
            Bottom(
              icon: Icons.favorite_border,
              title: 'Add to Wishlist',
              background: Colors.black,
            ),
            Bottom(
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
  const Bottom({
    super.key,
    required this.background,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 10),
              Text(title, style: TextStyle(color: Colors.white, fontSize: 17)),
            ],
          ),
        ),
      ),
    );
  }
}
