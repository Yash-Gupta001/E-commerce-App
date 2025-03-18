import 'package:app4/pages/MainMenu.dart';
import 'package:app4/pages/ProfilePage.dart';
import 'package:app4/pages/auth/userdetails.dart';
import 'package:app4/pages/cart.dart';
import 'package:app4/pages/favorite_products.dart';
import 'package:app4/pages/search.dart';
import 'package:double_back_to_exit/double_back_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DoubleBackToExit(
      snackBarMessage: 'press back again to exit',
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,      
        home: Home(),
      
        // home: Home(),
        routes: {
          '/home': (context) => Home(),
          '/search': (context) => Search(),
          '/cart': (context) => Cart(),
          '/favorite': (context) => FavoriteProducts(),
          '/profile': (context) => Profilepage(),
        },
      ),
    );
  }
}

