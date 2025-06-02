import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget listTile(IconData iconData, String title) {
    return Column(
      children: [
        Divider(thickness: 3),
        ListTile(
          leading: Icon(iconData),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios_sharp),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: AppColors.primaryColor,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 40,
                        left: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rafiullah',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                  Text(
                                    'helloworld@gmail.com',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              SizedBox(width: 30), // تھوڑا سا gap دینے کے لیے
                              CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                radius: 21,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.scaffoldBackground,
                                  radius: 18,
                                  child: Icon(
                                    Icons.edit,
                                    color: AppColors.primaryColor,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              listTile(
                                Icons.screen_search_desktop_outlined,
                                'My Order',
                              ),
                              listTile(
                                Icons.location_on_outlined,
                                'My Delivery Address',
                              ),
                              listTile(
                                Icons.person_outline_sharp,
                                'Refer A Friends',
                              ),
                              listTile(
                                Icons.file_copy_outlined,
                                'Terms & Conditions',
                              ),
                              listTile(
                                Icons.privacy_tip_outlined,
                                'Privacy Policy',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 110),
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Color(0xFFd4d181)),
                  ),
                  child: Center(
                    child: Text(
                      'Vegi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
