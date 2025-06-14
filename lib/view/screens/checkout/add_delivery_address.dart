import 'package:e_commerce/view/screens/checkout/google_map_srceen.dart';
import 'package:e_commerce/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/providers/check_out_provider/add_delivery_address_provider.dart';

class AddDeliveryAddressScreen extends StatefulWidget {
  const AddDeliveryAddressScreen({super.key});

  @override
  State<AddDeliveryAddressScreen> createState() =>
      _AddDeliveryAddressScreenState();
}

enum AddressType { home, workPlace, other }

class _AddDeliveryAddressScreenState extends State<AddDeliveryAddressScreen> {
  AddressType addressType = AddressType.home;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDeliveryAddressProvider>(
      builder: (context, provider, child) {
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
                Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      CustomField(
                        labelText: 'First Name',
                        emptyError: 'firstname is empty',
                        controller: provider.firstNameController,
                      ),
                      CustomField(
                        labelText: 'Last Name',
                        emptyError: 'lastname is empty',
                        controller: provider.lastNameController,
                      ),
                      CustomField(
                        labelText: 'Mobile No',
                        emptyError: 'Mobile No is empty',
                        controller: provider.mobileNoController,
                      ),
                      CustomField(
                        labelText: 'Alternate Mobile No',
                        emptyError: 'Alternate Mobile No is empty',
                        controller: provider.alternateMobileNoController,
                      ),
                      CustomField(
                        labelText: 'Society / Apartment / Building',
                        emptyError: 'Society / Apartment / Building is empty',
                        controller: provider.societyController,
                      ),
                      CustomField(
                        labelText: 'Street / Road',
                        emptyError: 'Street / Road is empty',
                        controller: provider.streetController,
                      ),
                      CustomField(
                        labelText: 'Landmark',
                        emptyError: 'Landmark is empty',
                        controller: provider.landMarkController,
                      ),
                      CustomField(
                        labelText: 'City',
                        emptyError: 'City is empty',
                        controller: provider.cityController,
                      ),
                      CustomField(
                        labelText: 'Area',
                        emptyError: 'Area is empty',
                        controller: provider.areaController,
                      ),
                      CustomField(
                        labelText: 'Pincode',
                        emptyError: 'Pincode is empty',
                        controller: provider.pincodeController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleMapScreen()));
                    },
                    child: Text('Set Location', style: TextStyle(fontSize: 16))),
                Divider(color: Colors.black45),
                ListTile(title: Text('Address Type*')),
                RadioListTile<AddressType>(
                  title: Text('Home'),
                  secondary: Icon(
                    Icons.home_outlined,
                    color: AppColors.primaryColor,
                  ),
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
                  secondary: Icon(
                    Icons.work_outline,
                    color: AppColors.primaryColor,
                  ),
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
                  secondary: Icon(
                    Icons.devices_other,
                    color: AppColors.primaryColor,
                  ),
                  value: AddressType.other,
                  groupValue: addressType,
                  onChanged: (value) {
                    setState(() {
                      addressType = value!;
                    });
                  },
                ),
                MaterialButton(
                  height: 60,
                  onPressed: () {
                    if (provider.formKey.currentState!.validate()) {
                      provider.saveData(context, addressType);
                    }
                  },
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:
                      provider.isLoading
                          ? CircularProgressIndicator()
                          : Text('Add Address', style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
