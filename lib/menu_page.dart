import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/Data/food_data.dart';
import 'package:sushi_app/display_button.dart';
import 'package:sushi_app/food_details.dart';
import 'package:sushi_app/food_tile.dart';
import 'package:sushi_app/models/images_path.dart';
import 'package:sushi_app/mydrawer.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodlist = ref.watch(Shop().foodmenuprovider);
    // return ref.watch(foodMenuProvider).when(
    //       data: (data) {
    //         return Scaffold(
    //           backgroundColor: Colors.grey[300],
    //           appBar: AppBar(
    //             iconTheme:
    //                 const IconThemeData().copyWith(color: Colors.grey[900]),
    //             backgroundColor: Colors.transparent,
    //             title: Text(
    //               'Tokyo',
    //               style: TextStyle(color: Colors.grey[900]),
    //             ),
    //             centerTitle: true,
    //           ),
    //           drawer: const Drawer(),
    //           body: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               //Promo Offers
    //               Container(
    //                 margin: const EdgeInsets.symmetric(horizontal: 25),
    //                 padding: const EdgeInsets.symmetric(
    //                     vertical: 25, horizontal: 30),
    //                 decoration: BoxDecoration(
    //                   color: const Color.fromARGB(255, 138, 60, 55),
    //                   borderRadius: BorderRadius.circular(15),
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Column(
    //                       children: [
    //                         Text(
    //                           "Get 32% Promo",
    //                           style: GoogleFonts.dmSerifDisplay(
    //                               fontSize: 22, color: Colors.white),
    //                         ),
    //                         const SizedBox(
    //                           height: 25,
    //                         ),
    //                         DisplayButton(text: 'Reedem', onTap: () {})
    //                       ],
    //                     ),
    //                     Image.asset(
    //                       'assets/images/sushi1.png',
    //                       height: 100,
    //                     )
    //                   ],
    //                 ),
    //               ),

    //               const SizedBox(
    //                 height: 25,
    //               ),

    //               //Serach Bar
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
    //                 child: TextField(
    //                   decoration: InputDecoration(
    //                     filled: true,
    //                     fillColor: Colors.white,
    //                     hintText: 'Search here..',
    //                     focusedBorder: OutlineInputBorder(
    //                         borderSide: const BorderSide(color: Colors.white),
    //                         borderRadius: BorderRadius.circular(20)),
    //                     enabledBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(20),
    //                         borderSide: const BorderSide(color: Colors.white)),
    //                   ),
    //                 ),
    //               ),

    //               const SizedBox(
    //                 height: 25,
    //               ),

    //               //menu title
    //               const Padding(
    //                 padding: EdgeInsets.symmetric(horizontal: 25.0),
    //                 child: Text(
    //                   'Food Menu',
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 18,
    //                   ),
    //                 ),
    //               ),

    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               //menu

    //               Expanded(
    //                 child: ListView.builder(
    //                   itemCount: data.length,
    //                   itemBuilder: (context, index) =>
    //                       FoodTile(fooditem: data[index]),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //       error: (error, stackTrace) => Scaffold(body: Text(error.toString())),
    //       loading: () => const Scaffold(body: CircularProgressIndicator()),
    //     );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.pushNamed(context, "/cartpage");
        }, icon: Icon(Icons.shopping_cart_rounded,color: Colors.grey[900],))],
        iconTheme: const IconThemeData().copyWith(color: Colors.grey[900]),
        backgroundColor: Colors.transparent,
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Promo Offers
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 138, 60, 55),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 22, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    DisplayButton(text: 'Reedem', onTap: () {})
                  ],
                ),
                Image.asset(
                  'assets/images/sushi1.png',
                  height: 100,
                )
              ],
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          //Serach Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search here..',
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          //menu title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          //menu

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodlist.length,
              itemBuilder: (context, index) => FoodTile(
                fooditem: foodlist[index],
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FoodDetails(
                      foodItem: foodlist[index],
                    ),
                  ));
                },
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "Popular Food",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
              padding: const EdgeInsets.all(25),
              child: ListTile(
                leading: Image.asset(ImagePath().sushi),
                title: Text(
                  'Salmon Eggs',
                  style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                ),
                subtitle: const Text('\$21.00'),
                trailing: const Icon(Icons.favorite_border),
              ))
        ],
      ),
    );
  }
}
