import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/display_button.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/providers/cart_provider.dart';

class FoodDetails extends ConsumerStatefulWidget {
  const FoodDetails({super.key, required this.foodItem});

  final Food foodItem;

  @override
  ConsumerState<FoodDetails> createState() => _FoodDetailsState();
}

class CartCounterProvider extends StateNotifier<int>{
  CartCounterProvider(): super(0);


  int get getCount => state;

  void incrementItem(){
    state = state +1;
  }

  void decrementItem(){
    if(state > 0){
      state--;
    }
  }

}

class _FoodDetailsState extends ConsumerState<FoodDetails> {
  final cartCounterProvider = StateNotifierProvider<CartCounterProvider,int>((ref) => CartCounterProvider());
  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(cartCounterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(
                    widget.foodItem.imagePath,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.foodItem.rating,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.foodItem.title,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Salmon sushi is a popular Japanese dish that features thinly sliced raw salmon served atop a small mound of vinegared rice, typically seasoned with a touch of soy sauce and wasabi. The salmon used in sushi is often high-quality, fresh fish known for its rich flavor and delicate texture. It is commonly enjoyed as part of a sushi platter or as individual pieces known as nigiri sushi.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 138, 60, 55),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.foodItem.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    //counters
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(109, 140, 94, 91),
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                            onPressed: () {
                              ref
                                  .read(cartCounterProvider.notifier)
                                  .decrementItem();
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: Center(
                            child: Text(
                              '$counter',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(109, 140, 94, 91),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: () {
                              ref
                                  .read(cartCounterProvider.notifier)
                                  .incrementItem();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                DisplayButton(text: 'Add To Cart', onTap: () {
                  ref.read(cartprovider.notifier).addTocart(widget.foodItem, counter,context);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
