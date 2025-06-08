import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/providers/cart-provider/fetch_cart_data_provider.dart';
import 'package:e_commerce/view/widgets/search_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewCartScreen extends StatefulWidget {
  const ReviewCartScreen({super.key});

  @override
  State<ReviewCartScreen> createState() => _ReviewCartScreenState();
}

class _ReviewCartScreenState extends State<ReviewCartScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<FetchCartDataProvider>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FetchCartDataProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: AppBar(
            title: Text('Review Cart'),
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
                          id: data.id,
                          quantity: data.quantity,

                          ///agr ye delete ka function na laga gya to Null Check ka error asakta hai
                          onDelete: () {
                            provider.delete(data.id);
                          },
                          image: data.image,
                          name: data.name,
                          price: data.unit ?? '',
                          isReviewCart: true,
                        );
                      },
                    ),
                  ),
        );
      },
    );
  }
}
