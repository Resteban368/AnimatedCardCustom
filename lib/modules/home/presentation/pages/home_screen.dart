import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/character/character_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_card_custom/modules/home/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().add(LoadedCharacter(page));
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        page++;

        context.read<CharacterBloc>().add(LoadedCharacter(page));
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const InfoAppBarWidget(),
          Expanded(
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                if (state is CharacterInitial) {
                  return const Center(child: _GifLoading());
                } else if (state is CharacterLoaded) {
                  return Center(
                      child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 12, left: 12, right: 12, top: 30),
                          height: size.height * 0.8,
                          width: double.infinity,
                          child: ListView.builder(
                            controller: scrollController,
                            padding: const EdgeInsets.only(bottom: 16, top: 1),
                            cacheExtent: 1,
                            itemCount: isLoading
                                ? state.characters.length + 2
                                : state.characters.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index < state.characters.length) {
                                return GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context)
                                        .go('/character', extra: {
                                      'character': state.characters[index],
                                    });
                                  },
                                  child: AnimatedCardCustom(
                                    reponseCharacter: state.characters[index],
                                    scoreIncurrentDuration: ((50 - index) * 19)
                                        .toString(), //random score
                                    itemIndex: index + 1,
                                  ),
                                )
                                    .animate()
                                    .flipH(perspective: -0.5, begin: 0.3)
                                    .fadeIn();
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          )));
                } else {
                  return Center(child: Text(state.toString()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}



class _GifLoading extends StatelessWidget {
  const _GifLoading();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(
            bottom: 12, left: 12, right: 12, top: size.height * 0.18),
        width: 500,
        height: 400,
        child: Image.asset(
          'assets/portal.gif',
          fit: BoxFit.fill,
        ));
  }
}
