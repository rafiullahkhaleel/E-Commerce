import 'package:e_commerce/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressType { home, workPlace, other }

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  AddressType addressType = AddressType.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Add Delivery Address',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomField(labelText: 'First Name'),
            CustomField(labelText: 'Last Name'),
            CustomField(labelText: 'Mobile No'),
            CustomField(labelText: 'Alternate Mobile No'),
            CustomField(labelText: 'Society / Apartment / Building'),
            CustomField(labelText: 'Street / Road'),
            CustomField(labelText: 'Landmark'),
            CustomField(labelText: 'City'),
            CustomField(labelText: 'Area'),
            CustomField(labelText: 'Pincode'),
            SizedBox(height: 15),
            Text('Set Location', style: TextStyle(fontSize: 16)),
            Divider(color: Colors.black45),
            ListTile(title: Text('Address Type*')),
            RadioListTile<AddressType>(
              title: Text('Home'),
              secondary: Icon(Icons.home_outlined,color: AppColors.primaryColor,),
              value: AddressType.home,
              groupValue: addressType,
              onChanged: (value) {
                setState(() {
                  addressType = value!;
                });
              },
            ),
            RadioListTile<AddressType>(
              title: Text('Work'),
              secondary: Icon(Icons.work_outline,color: AppColors.primaryColor,),
              value: AddressType.workPlace,
              groupValue: addressType,
              onChanged: (value) {
                setState(() {
                  addressType = value!;
                });

              },
            ),
            RadioListTile<AddressType>(
              title: Text('Other'),
              secondary: Icon(Icons.devices_other,color: AppColors.primaryColor,),
              value: AddressType.other,
              groupValue: addressType,
              onChanged: (value) {
                setState(() {
                  addressType = value!;
                });

              },
            ),
          ],
        ),
      ),
    );
  }
}
