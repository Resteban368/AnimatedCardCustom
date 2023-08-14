// ignore_for_file: file_names

import 'package:animated_card_custom/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/character_models.dart';

class AnimatedCardCustom extends StatefulWidget {
  const AnimatedCardCustom({
    super.key,
    required this.itemIndex,
    required this.scoreIncurrentDuration, required this.reponseCharacter,
  });

  final int itemIndex;
  final String scoreIncurrentDuration;
 final Character reponseCharacter;

  @override
  State<AnimatedCardCustom> createState() => _AnimatedCardCustomState();
}

class _AnimatedCardCustomState extends State<AnimatedCardCustom> {
  bool onTaped = false;
  bool onTapeDown = false;
  Function onTap = () {};

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return

        Container(
      margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      height: 150,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.only(left: 12, right: 16, top: 0),
      decoration: ShapeDecoration(
        color: AppTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    widget.itemIndex.toString(),
                    style: themeData.textTheme.titleLarge!.copyWith(
                        fontSize: 24.2,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),

                //Todo: animacion de numero
              ).animate().rotate(
                  begin: 0.4,
                  duration: 250.ms,
                  delay: 200.ms,
                  alignment: Alignment.topCenter),

              const SizedBox(width: 10),

              //Todo: contenedor de la imagen
              Container(
                padding: const EdgeInsets.all(2),
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: widget.itemIndex,
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/giphy.gif'),
                      image: NetworkImage(widget.reponseCharacter.image.toString()),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              //Todo: nombre del personaje
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.reponseCharacter.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    )
                        .animate(delay: 300.ms)
                        .moveX(begin: 100)
                        .then()
                        .shakeX(hz: 4, amount: 3),
                    const SizedBox(height: 8),
                    Text(
                      widget.reponseCharacter.status.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                          GoogleFonts.outfit(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          )),
        ],
      ),
      // ),
    );
  }
}
