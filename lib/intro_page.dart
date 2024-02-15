import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/display_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SUSHI MAN",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('assets/images/sushi3.png'),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Fell the taste of the most popular Japanese food from anywhere and anytime.",
                style: TextStyle(color: Colors.grey[200], height: 2),
              ),
              const SizedBox(height: 25,),
              DisplayButton(text: "Get Started",onTap: (){
                Navigator.pushNamed(context, '/homepage');
              },)
            ],
          ),
        ),
      ),
    );
  }
}
