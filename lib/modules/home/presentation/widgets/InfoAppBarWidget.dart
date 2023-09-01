// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:animated_card_custom/config/theme/app_theme.dart';
import 'package:animated_card_custom/modules/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoAppBarWidget extends StatelessWidget {
  const InfoAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 130,
        decoration: const BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BounceInDown(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  'Character \nRick and Morty',
                  style: GoogleFonts.outfit(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchCharacter());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: AppTheme.primary,
                  )),
            )
          ],
        ));
  }
}
