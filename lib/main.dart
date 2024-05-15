import 'package:cartflutter/pages/cart_page.dart';
import 'package:cartflutter/pages/intro_page.dart';
import 'package:cartflutter/pages/shop_page.dart';
import 'package:cartflutter/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/shop.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page':(context) => IntroPage(),
        '/shop_page':(context) => ShopPage(),
        '/cart_page':(context) => CartPage(),
      },
    );
  }
}

