import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/view/widgets/search_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/wishlist_provider/fetch_wishlist_data.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<FetchWishlistDataProvider>(
        context,
        listen: false,
      ).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FetchWishlistDataProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: AppBar(
            title: Text('Wishlist'),
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
          ),
          body:
              provider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : provider.error != null
                  ? Center(child: Text('ERROR ${provider.error}'))
                  : provider.snapshot.isEmpty
                  ? Center(
                    child: Text(
                      'No Data',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      itemCount: provider.snapshot.length,
                      itemBuilder: (context, index) {
                        final data = provider.snapshot[index];
                        return SearchItems(
                          ///agr ye delete ka function na laga gya to Null Check ka error asakta hai
                          onDelete: () {
                            provider.delete(data.id);
                          },
                          image: data.image,
                          name: data.name,
                          price: data.price,
                        );
                      },
                    ),
                  ),
        );
      },
    );
  }
}
