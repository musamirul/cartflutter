import 'package:cartflutter/components/my_drawer.dart';
import 'package:cartflutter/components/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Page"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // go to cart button
          IconButton(onPressed: ()=>Navigator.pushNamed(context, '/cart_page'), icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          SizedBox(height: 15,),
          //shop subtitle
          Center(
              child: Text("Pick from a selected list of premium products", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
          ),

          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                //get each individual product from shop
                final product = products[index];

                //return as a product tile UI
                return MyProductTile(product: product);
              },),
          ),
        ],
      ),
    );
  }
}
