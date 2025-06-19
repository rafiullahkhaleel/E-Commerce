import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/providers/check_out_provider/fetch_delivery_detail_provider.dart';
import 'package:e_commerce/view/screens/checkout/add_delivery_address_screen.dart';
import 'package:e_commerce/view/screens/checkout/payment_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryDetailScreen extends StatefulWidget {
  DeliveryDetailScreen({super.key});

  @override
  State<DeliveryDetailScreen> createState() => _DeliveryDetailScreenState();
}

class _DeliveryDetailScreenState extends State<DeliveryDetailScreen> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<FetchDeliveryDetailProvider>(
        context,
        listen: false,
      ).fetchData();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FetchDeliveryDetailProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              'Delivery Details',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body:
              provider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : provider.error != null
                  ? Center(child: Text(provider.error.toString()))
                  : ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.location_on, size: 40),
                        title: Text(
                          'Deliver To',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start, // important!
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.primaryColor,
                                ),
                                SizedBox(width: 10),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              provider
                                                      .deliveryAddressData
                                                      ?.firstName ??
                                                  '',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          Container(
                                            width: 70,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: Text(
                                                provider
                                                        .deliveryAddressData
                                                        ?.address ??
                                                    '',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'KPK/Pakistan, ${provider.deliveryAddressData?.city ?? ''}, ${provider.deliveryAddressData?.area ?? ''} street ${provider.deliveryAddressData?.street ?? ''}, pincode ${provider.deliveryAddressData?.pincode ?? ''}',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      Text(
                                        provider
                                                .deliveryAddressData
                                                ?.mobileNo ??
                                            '',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddDeliveryAddressScreen(),
                ),
              );
            },
            backgroundColor: AppColors.primaryColor,
            shape: CircleBorder(),
            child: Icon(Icons.add, color: Colors.white),
          ),
          bottomNavigationBar: Container(
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: MaterialButton(
              onPressed: () {
                provider.error != null
                    ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDeliveryAddressScreen(),
                      ),
                    )
                    : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSummaryScreen(),
                      ),
                    );
              },
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child:
                  provider.error != null
                      ? Text('Add New Address', style: TextStyle(fontSize: 17))
                      : Text('Payment Summary', style: TextStyle(fontSize: 17)),
            ),
          ),
        );
      },
    );
  }
}
