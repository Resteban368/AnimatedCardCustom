// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/splash.jpg',
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
            const _TitelAndSubtitle(),
            const _Btn(),
          ],
        ),
      ),
    );
  }
}

class _TitelAndSubtitle extends StatelessWidget {
  const _TitelAndSubtitle(
  );


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: size.height * 0.05),
      width: size.width,
      height: size.height * 0.2,
      // color: Colors.red,
      child: Text(
        'Character \nRick and Morty',
        style: GoogleFonts.outfit(
          fontSize: 45,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
         
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  const _Btn();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
          margin: EdgeInsets.only(top: size.height * 0.8),
          height: 60,
          width: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 165, 249, 87),
                  Color.fromARGB(255, 142, 230, 70),
                  Color.fromARGB(255, 137, 221, 41),
                ]),
          ),
          child: TextButton(
            onPressed: () {
              context.go('/home');
            },
            child: Text(
              'Let\'s Explore!',
              style: GoogleFonts.outfit(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
