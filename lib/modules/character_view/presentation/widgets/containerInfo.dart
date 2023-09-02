// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/app_theme.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({super.key, 
    required this.info,
    required this.title,
  });

  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title:',
            style: GoogleFonts.outfit(
                fontSize: 20,
                color: AppTheme.primary,
                fontWeight: FontWeight.bold),
          ),
          Text(
            info,
            style: GoogleFonts.outfit(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}