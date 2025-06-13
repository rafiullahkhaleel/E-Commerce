import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/view/widgets/ordered_item.dart';
import 'package:flutter/material.dart';

class PaymentSummaryScreen extends StatefulWidget {
  const PaymentSummaryScreen({super.key});

  @override
  State<PaymentSummaryScreen> createState() => _PaymentSummaryScreenState();
}

 enum PaymentOption{home,online}

class _PaymentSummaryScreenState extends State<PaymentSummaryScreen> {
  PaymentOption paymentOption = PaymentOption.online;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Payment Summary'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('First & Last Name'),
            subtitle: Text(
              'KPK/Pakistan, Peshawar, Warsak Road Mathra street 20, pincode 2500',
            ),
          ),
          Divider(),
          ExpansionTile(
            title: Text(
              'Ordered Items 6',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              OrderedItem(),
              OrderedItem(),
              OrderedItem(),
              OrderedItem(),
              OrderedItem(),
              OrderedItem(),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Sub Total'),
            trailing: Text('\$200', style: TextStyle(fontSize: 15)),
          ),
          Divider(),
          ListTile(
            title: Text('Shipping Charge'),
            trailing: Text('\$0', style: TextStyle(fontSize: 15)),
          ),
          Divider(),
          ListTile(
            title: Text('Compen Discount'),
            trailing: Text('\$10', style: TextStyle(fontSize: 15)),
          ),
          ListTile(
            title: Text('Payment Options'),

          ),
          RadioListTile(
            title: Text('Online'),
              value:PaymentOption.online,
              secondary: Icon(Icons.book_online_outlined,color: AppColors.primaryColor,),
              groupValue: paymentOption,
              onChanged: (value){
              setState(() {
                paymentOption = value!;
              });
              }),
          RadioListTile(
              title: Text('Home'),
              value:PaymentOption.home,
              secondary: Icon(Icons.home_outlined,color: AppColors.primaryColor,),
              groupValue: paymentOption,
              onChanged: (value){
                setState(() {
                  paymentOption = value!;
                });
              })
        ],
      ),
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text(
          '300\$',
          style: TextStyle(
            fontSize: 17,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.black,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .15,
            ),
          ),
          child: Text('Place Order'),
        ),
      ),
    );
  }
}
