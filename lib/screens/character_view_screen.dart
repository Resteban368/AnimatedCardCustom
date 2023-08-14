// ignore_for_file: dead_code

import 'package:animate_do/animate_do.dart';
import 'package:animated_card_custom/bloc/origin/origin_bloc.dart';
import 'package:animated_card_custom/models/character_models.dart';
import 'package:animated_card_custom/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/origin_models.dart';

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
                SizedBox(
                  width: double.infinity,
                  child: Stack(children: [
                    Center(
                      child: Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 20),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 10)
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Hero(
                                tag: character.id!,
                                child: Image.network(
                                  character.image.toString(),
                                  fit: BoxFit.fill,
                                  width: size.width * 0.8,
                                  height: size.height * 0.3,
                                ),
                              ))),
                    ),
                    Positioned(
                        top: 15,
                        right: 20,
                        child: BounceInDown(
                          duration: const Duration(milliseconds: 500),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 50,
                              height: 50,
                              color: AppTheme.primary,
                              child: IconButton(
                                onPressed: () {
                                  //llamamos al bloc
                                  BlocProvider.of<OriginBloc>(context).add(
                                      LoadedOrigin(character.origin!.url!));
                                  _showModalViewLocation(context, 'Origin');
                                },
                                icon: const Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        top: 75,
                        right: 20,
                        child: BounceInDown(
                          duration: const Duration(milliseconds: 500),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 50,
                              height: 50,
                              color: AppTheme.primary,
                              child: IconButton(
                                onPressed: () {
                                  //llamamos al bloc
                                  BlocProvider.of<OriginBloc>(context).add(
                                      LoadedOrigin(character.location!.url!));
                                  _showModalViewLocation(context,'Location');
                                },
                                icon: const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BounceInDown(
                      delay: const Duration(milliseconds: 300),
                      child: _ContainerInfo(
                        title: 'Status',
                        info:
                            true ? texto.replaceAll('Status.', '') : 'Unknown',
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
                SizedBox(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    child: ListView.builder(
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
                    )),
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

void _showModalViewLocation(BuildContext context, String titel) {
  showDialog(
      context: context,
      builder: (context) {
        final size = MediaQuery.sizeOf(context);
        return AlertDialog(
          title: Center(
            child: Text(
              titel,
              style: GoogleFonts.outfit(
                  fontSize: 20,
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: BlocBuilder<OriginBloc, OriginState>(
            builder: (context, state) {
              print('state: $state');

              if (state is OriginInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is OriginLoaded) {
                // return ListView.builder(
                //   itemCount: state.origins.residents!.length,
                //   itemBuilder: (context, index) => Column(
                //     children: [
                //       Card(
                //         elevation: 5,
                //         child: ListTile(
                //           leading: const Icon(
                //             Icons.person,
                //             color: AppTheme.primary,
                //           ),
                //           title: Text('Resident ${index + 1}',
                //               style: GoogleFonts.outfit(
                //                   fontWeight: FontWeight.bold,
                //                   color: AppTheme.primary)),
                //           subtitle: Text(
                //               state.origins.residents![index].toString(),
                //               style: GoogleFonts.outfit(
                //                   fontWeight: FontWeight.bold)),
                //         ),
                //       ),
                //       const Divider()
                //     ],
                //   ),

                // );
                return Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: size.width * 0.9,
                        height: 80,
                        child: Card(
                            elevation: 5,
                            child: ListTile(
                              //name
                              title: Text('Name:'),
                              subtitle: Text(
                                state.origins.name!,
                                style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primary),
                              ),
                            ))),
                    Text('Residents:',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primary)),
                    Container(
                      margin: const EdgeInsets.only( top: 20),
                      width: size.width * 0.9,
                      height: size.height * 0.6,
                      child: ListView.builder(
                        itemCount: state.origins.residents!.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Card(
                              elevation: 5,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.person,
                                  color: AppTheme.primary,
                                ),
                                title: Text('Resident ${index + 1}',
                                    style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primary)),
                                subtitle: Text(
                                    state.origins.residents![index].toString(),
                                    style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const Divider()
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Container(
                  width: size.width * 0.9,
                  height: size.height * 0.1,
                  child: const Center(
                    child: Text('unknown'),
                  ),
                );
              }
            },
          ),
        );
      });
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
