import 'package:flutter/material.dart';

class DisplayButton extends StatelessWidget {
  const DisplayButton({super.key,required this.text,required this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const  Color.fromARGB(212, 135, 81, 77),
          borderRadius: BorderRadius.circular(50)
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,style: const TextStyle(color: Colors.white),),
            const SizedBox(width: 10,),
            const Icon(Icons.arrow_forward,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
