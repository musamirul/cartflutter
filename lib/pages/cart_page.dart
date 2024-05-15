import 'package:cartflutter/components/my_button.dart';
import 'package:cartflutter/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product){
    // show a dialog box to ask user to confirm to remove from cart
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text("Remove this item from your cart?"),
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
            context.read<Shop>().removeFromCart(product);
          },
          child: Text("Yes"),
        ),
      ],
    ),);
  }

  // user pressed Pay Now button
  void payButtonPressed(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("User wants to pay! Connect this app to your payment banking"),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(child: cart.isEmpty ? Center(child: Text("Your cart is empty..")) : ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
            // get individual item in cart
            final item = cart[index];
            //return as a cart tile UI
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toStringAsFixed(2)),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => removeItemFromCart(context, item),
              ),
            );
          },),),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: ()=>payButtonPressed(context), child: Text("Pay Now"),),
          ),
        ],
      ),
    );
  }
}
