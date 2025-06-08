import 'package:e_commerce/core/providers/cart-provider/fetch_cart_data_provider.dart';
import 'package:e_commerce/core/providers/fruit_provider/fresh_fruit_provider.dart';
import 'package:e_commerce/core/providers/herb_provider/herbs_product_provider.dart';
import 'package:e_commerce/core/providers/cart-provider/save_cart_data.dart';
import 'package:e_commerce/core/providers/user_provider/user_data_provider.dart';
import 'package:e_commerce/core/sevices/auth_sevices.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/view/screens/auth/sign_in_screen.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:e_commerce/view/widgets/unit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/providers/wishlist_provider/fetch_wishlist_data.dart';
import 'core/providers/wishlist_provider/save_wishlist_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HerbsProductProvider()),
        ChangeNotifierProvider(create: (_) => FreshFruitProductProvider()),
        ChangeNotifierProvider(create: (_) => UserDataProvider()),
        ChangeNotifierProvider(create: (_) => SaveCartDataProvider()),
        ChangeNotifierProvider(create: (_) => FetchCartDataProvider()),
        ChangeNotifierProvider(create: (_) => SaveWishlistDataProvider()),
        ChangeNotifierProvider(create: (_) => FetchWishlistDataProvider()),
        ChangeNotifierProvider(create: (_) => FetchUserDataProvider()),
        ChangeNotifierProvider(create: (_) => SaveCartDataProvid()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:
            FirebaseAuth.instance.currentUser != null
                ? HomeScreen()
                : SignInScreen(),
      ),
    );
  }
}
