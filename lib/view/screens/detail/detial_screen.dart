import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  const DetailScreen({super.key, required this.name, required this.imageUrl});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
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
                          widget.imageUrl,
                          width: MediaQuery.of(context).size.width * .6,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                          '50\$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '+ADD',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
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
