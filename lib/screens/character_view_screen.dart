// ignore_for_file: dead_code

import 'package:animate_do/animate_do.dart';
import 'package:animated_card_custom/models/character.dart';
import 'package:animated_card_custom/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterViewScreen extends StatelessWidget {
  const CharacterViewScreen({Key? key, required this.character})
      : super(key: key);

  final Character character;

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
      child: Column(
        children: [
          AppBar(title: character.name!),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10)
                      ],
                    ),
                    width: size.width * 0.8,
                    height: size.height * 0.3,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Hero(
                          tag: character.id!,
                          child: Image.network(
                            character.image.toString(),
                            fit: BoxFit.fill,
                          ),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BounceInDown(
                      delay: const Duration(milliseconds: 300),
                      child: _ContainerInfo(
                        title: 'Status',
                        info: true
                            ? texto.replaceAll('Status.', '')
                            : 'Unknown',
                      ),
                    ),
                    BounceInDown(
                      delay: const Duration(milliseconds: 300),
                      child: _ContainerInfo(
                        title: 'Species',
                        info: character.species == null
                            ? 'Unknown'
                            : species.replaceAll('Species.', ''),
                      ),
                    ),
                    BounceInDown(
                      delay: const Duration(milliseconds: 300),
                      child: _ContainerInfo(
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
                Card(
                  child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.2,
                      child: ListView.builder(
                        itemCount: character.episode!.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            ListTile(
                              //icono de video
                              // trailing: const Icon(Icons.video_collection),
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
                            const Divider()
                          ],
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class _ContainerInfo extends StatelessWidget {
  const _ContainerInfo({
    super.key,
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

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.2,
        decoration: const BoxDecoration(
            //bordes solo en la parte de abaajo
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: AppTheme.primary),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                context.go('/home');
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            Container(
              alignment: Alignment.center,
              // color: Colors.red,
              width: size.width * 0.8,
              child: Text(
                title,
                style: GoogleFonts.outfit(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
