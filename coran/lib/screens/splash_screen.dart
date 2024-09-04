import 'package:coran/screens/globales.dart';
import 'package:coran/screens/home_screen.dart';
import 'package:coran/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Coran application",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Lire et Reciter \n le coran chaque jour",
                  style: GoogleFonts.poppins(fontSize: 16, color: text),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.68,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFF672C8C)),
                      child: Image.asset("assets/images/coran.png"),
                    ),
                    Positioned(
                      left: 0,
                      bottom: -23,
                      right:0 ,
                      child: Center(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                            decoration: BoxDecoration(color: orange,
                            borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Commencer",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
