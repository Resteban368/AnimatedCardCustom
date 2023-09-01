// ignore_for_file: file_names

import 'package:animated_card_custom/config/theme/app_theme.dart';
import 'package:animated_card_custom/modules/home/domain/entities/character_entitie.dart';
import 'package:animated_card_custom/modules/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedCardCustom extends StatefulWidget {
  const AnimatedCardCustom({
    super.key,
    required this.itemIndex,
    required this.scoreIncurrentDuration,
    required this.reponseCharacter,
  });

  final int itemIndex;
  final String scoreIncurrentDuration;
  final CharacterEntity reponseCharacter;

  @override
  State<AnimatedCardCustom> createState() => _AnimatedCardCustomState();
}

class _AnimatedCardCustomState extends State<AnimatedCardCustom> {
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
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
              ).animate().rotate(
                  begin: 0.4,
                  duration: 250.ms,
                  delay: 200.ms,
                  alignment: Alignment.topCenter),
              const SizedBox(width: 10),
              ContainerImage(
                  urlImg: widget.reponseCharacter.image.toString(),
                  itemIndex: widget.itemIndex),
              const SizedBox(width: 10),
              InfoCharacter(
                name: widget.reponseCharacter.name.toString(),
                status: widget.reponseCharacter.status.toString(),
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


