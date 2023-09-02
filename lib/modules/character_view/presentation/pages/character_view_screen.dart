// ignore_for_file: dead_code, avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:animated_card_custom/modules/home/domain/entities/character_entitie.dart';
import 'package:flutter/material.dart';

import '../widgets/widgest.dart';

class CharacterViewScreen extends StatelessWidget {
  const CharacterViewScreen({Key? key, required this.character})
      : super(key: key);

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String texto = character.status.toString();
    String species = character.species.toString();
    String gender = character.gender.toString();
    return Scaffold(
        body: SizedBox(
      width: size.width,
      height: size.height,
      // color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBarView(title: character.name!),
            Column(
              children: [
                Info(
                    id: character.id!,
                    urlimg: character.image.toString(),
                    urlOrigin: character.origin!.url!,
                    urlLocation: character.location!.url!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BounceInDown(
                      delay: const Duration(milliseconds: 300),
                      child: ContainerInfo(
                        title: 'Status',
                        info: true
                            ? texto.replaceAll('Status.', '')
                            : 'Unknown',
                      ),
                    ),
                    BounceInDown(
                      delay: const Duration(milliseconds: 300),
                      child: ContainerInfo(
                        title: 'Species',
                        info: character.species == null
                            ? 'Unknown'
                            : species.replaceAll('Species.', ''),
                      ),
                    ),
                    BounceInDown(
                      delay: const Duration(milliseconds: 300),
                      child: ContainerInfo(
                        title: 'Gender',
                        info: character.gender == null
                            ? 'Unknown'
                            : gender.replaceAll('Gender.', ''),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListaViewEpisodios(
                  character: character,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
