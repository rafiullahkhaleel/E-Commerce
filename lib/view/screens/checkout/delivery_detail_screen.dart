import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/view/screens/checkout/add_delivery_address.dart';
import 'package:e_commerce/view/screens/checkout/payment_summary.dart';
import 'package:flutter/material.dart';

class DeliveryDetailScreen extends StatelessWidget {
  DeliveryDetailScreen({super.key});
  final List<Widget> isAddress = [
    Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // important!
            children: [
              CircleAvatar(radius: 20, backgroundColor: AppColors.primaryColor),
              SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Rafiullah',
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
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Home',
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
                      'KPK/Pakistan, Peshawar, Warsak Road Mathra street 20, pincode 2500',
                      style: TextStyle(fontSize: 13),
                    ),
                    Text('+923139126361', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Delivery Details',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.location_on, size: 40),
            title: Text('Deliver To', style: TextStyle(fontSize: 18)),
          ),
          isAddress.isEmpty
              ? Container()
              : Column(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Rafiullah',
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
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Home',
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
                                'KPK/Pakistan, Peshawar, Warsak Road Mathra street 20, pincode 2500',
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                '+923139126361',
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
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: MaterialButton(
          onPressed: () {
            isAddress.isEmpty
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
              isAddress.isEmpty
                  ? Text('Add New Address', style: TextStyle(fontSize: 17))
                  : Text('Payment Summary', style: TextStyle(fontSize: 17)),
        ),
      ),
    );
  }
}
