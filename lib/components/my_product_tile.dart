import 'package:cartflutter/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context){
    // show a dialog box to ask user to confirm to add to cart
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text("Add this item to your cart?"),
      actions: [
        //cancel button
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),

        //yes button
        MaterialButton(
          onPressed: () {
            // pop dialog box
            Navigator.pop(context);

            //add to cart
            context.read<Shop>().addToCart(product);
          },
          child: Text("Yes"),
        ),
      ],
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                ),
              ),
              //product name
              //test
              SizedBox(height: 25,),
              Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 10,),
              //product description
              Text(product.description, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
              SizedBox(height: 25,),
            ],
          ),
          
          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product price
              Text('\$'+product.price.toStringAsFixed(2)),
              //add to cart button
              Container(
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(12),),
                  child: IconButton(
                      onPressed: ()=>addToCart(context),
                      icon: Icon(Icons.add),
                  ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
