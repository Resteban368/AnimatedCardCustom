
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCharacter extends StatelessWidget {
  final String name ;
  final String status;

  const InfoCharacter({super.key, required this.name, required this.status});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.outfit(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
            maxLines: 2,
            textAlign: TextAlign.center,
          )
              .animate(delay: 300.ms)
              .moveX(begin: 100)
              .then()
              .shakeX(hz: 4, amount: 3),
          const SizedBox(height: 8),
          Text(
            status,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.outfit(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}