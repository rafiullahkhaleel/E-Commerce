import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/providers/user_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    FetchUserDataProvider provider = Provider.of<FetchUserDataProvider>(context,listen: false);
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        provider.userData!.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      provider.userData!.email,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
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
                    image: DecorationImage(
                      image: NetworkImage(provider.userData!.image),
                    ),
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Color(0xFFd4d181)),
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
