

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/app_theme.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.15,
        decoration: const BoxDecoration(
            //bordes solo en la parte de abaajo
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: AppTheme.primary),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                onPressed: () {
                  context.go('/home');
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              // color: Colors.red,
              width: size.width * 0.8,
              child: BounceInRight(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  title,
                  style: GoogleFonts.outfit(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
