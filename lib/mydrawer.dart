import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: Column(
        children: [
          DrawerHeader(child: Image.asset('assets/images/sushi5.png'),),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(leading: const Icon(Icons.home), title: Text("H O M E",style: GoogleFonts.dmSerifDisplay(fontSize: 18),),),
          ),
          // ListTile(leading: const Icon(Icons.home), title: Text("H O M E"),)
        ],
      ),
    );
  }
}