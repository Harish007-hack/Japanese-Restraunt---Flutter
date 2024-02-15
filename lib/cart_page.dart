import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi_app/display_button.dart';
import 'package:sushi_app/providers/cart_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartitems = ref.watch(cartprovider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Cart'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Column(
        children: [
          //List veiw of listtiles cart
          Expanded(
            child: ListView.builder(
              itemCount: cartitems.length,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal:10,),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: const  Color.fromARGB(212, 135, 81, 77),borderRadius: BorderRadius.circular(20) ),
                child: ListTile(
                  leading: Image.asset(cartitems[index].imagePath),
                  title: Text(
                    cartitems[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${cartitems[index].price}',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        ref.read(cartprovider.notifier).deleteFromCart(cartitems[index]);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),

          // button

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: DisplayButton(text: 'Pay Now', onTap: (){}),
          )


        ],
      ),
    );
  }
}
