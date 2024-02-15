import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/images_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class Shop{

get foodMenuProvider => FutureProvider((ref) async {
      final menu = await Future.delayed(const Duration(seconds: 2), () => foodMenu);
      return menu;
    });


Provider<List<Food>> get foodmenuprovider => Provider((ref) => foodMenu);

List<Food> foodMenu = [
  Food(
      imagepath: ImagePath().sushi,
      price: 70.65,
      rating: 4.6,
      title: "Salmon Eggs"),
  Food(
      imagepath: ImagePath().sushi2,
      price: 75.50,
      rating: 4.6,
      title: "Salmon Sushi"),
  Food(
      imagepath: ImagePath().sushi4,
      price: 69.25,
      rating: 4.6,
      title: "Caviar Sushi"),
];

final List _cart = [];
List get cart =>_cart;

void addtoCart(Food food,int quantity){
  if(quantity>0){
    _cart.add(food);
  }

}


}