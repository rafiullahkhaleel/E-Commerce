import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/models/product_model.dart';
import 'package:e_commerce/view/widgets/search_items.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
 final List<ProductModel> searchList;
  const SearchScreen({super.key, required this.searchList});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  
  List<ProductModel> searchItem(String query){
    return widget.searchList.where((data){
      return data.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Search'),
        centerTitle: true,
        actions: [Icon(Icons.menu), SizedBox(width: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('items', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              onChanged: (value){
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                fillColor: Color(0xffB6B4B4),
                filled: true,
                suffixIcon: Icon(Icons.search),
                hintText: 'Search for items in the store',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: searchItem(query).length,
                  itemBuilder: (context,index){
                    final data = searchItem(query)[index];
                return SearchItems(
                  id: data.id,
                  isBool: true,
                  image: data.image,
                  unit: data.price,
                  name: data.name,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
