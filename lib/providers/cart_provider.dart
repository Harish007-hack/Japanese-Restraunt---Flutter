import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi_app/display_button.dart';
import 'package:sushi_app/models/food.dart';

class CartProvider extends StateNotifier<List<Food>> {
  CartProvider() : super([]);

  void addTocart(Food fooditem, int quantity, BuildContext context) {
    if (quantity > 0) {
      state = [fooditem, ...state];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content:const  Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Your Food Item was Successfully added to cart 🎊',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 138, 60, 55),
          actions: [
            DisplayButton(
                text: 'Ok',
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Padding(
            padding:  EdgeInsets.all(20.0),
            child: Text('Please add Atleast 1 or more quantity.',style: TextStyle(fontSize: 18,color: Colors.white),),
          ),
          backgroundColor: const Color.fromARGB(255, 138, 60, 55),
          actions: [
            DisplayButton(
                text: 'Ok',
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      );
    }
  }

  void deleteFromCart(Food foodItem) {
    state = state.where((element) => element != foodItem).toList();
  }
}

final cartprovider = StateNotifierProvider<CartProvider, List<Food>>(
  (ref) => CartProvider(),
);
