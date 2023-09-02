
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../home/domain/entities/character_entitie.dart';

class ListaViewEpisodios extends StatelessWidget {
  const ListaViewEpisodios({
    super.key,
     required this.character,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 0.9,
        height: size.height * 0.3,
        child: 
        
        ListView.builder(
          itemCount: character.episode!.length,
          itemBuilder: (context, index) => Column(
            children: [
              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.video_collection,
                    color: AppTheme.primary,
                  ),
                  title: Text('Episode ${index + 1}',
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary)),
                  subtitle: Text(
                      character.episode![index].toString(),
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const Divider()
            ],
          ),
        ),
        );
  }
}