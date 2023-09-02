import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/app_theme.dart';
import '../bloc/origin/origin_bloc.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.urlimg,
    required this.id,
    required this.urlOrigin,
    required this.urlLocation,
  });

  final String urlimg;
  final int id;
  final String urlOrigin;
  final String urlLocation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Stack(children: [
        Center(
          child: Container(
              margin: const EdgeInsets.only(top: 30, bottom: 20),
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: id,
                    child: Image.network(
                      urlimg,
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
                      BlocProvider.of<OriginBloc>(context)
                          .add(LoadedOrigin(urlOrigin));
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
                      BlocProvider.of<OriginBloc>(context)
                          .add(LoadedOrigin(urlLocation));
                      _showModalViewLocation(context, 'Location');
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
                              title: const Text('Name:'),
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
                      margin: const EdgeInsets.only(top: 20),
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
                return SizedBox(
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