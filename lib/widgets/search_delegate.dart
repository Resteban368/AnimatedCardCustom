import 'package:animated_card_custom/models/character_models.dart';
import 'package:animated_card_custom/repository/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchCharacter extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final repository = CharacterRepository();

    Widget circleLoading() {
      return const Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('assets/portal.gif'),
        ),
      );
    }

    if (query.isEmpty) {
      return circleLoading();
    }

    return FutureBuilder(
      future: repository.getCharacterByName(query),
      builder: (context, AsyncSnapshot<List<Character>> snapshot) {
        if (!snapshot.hasData) {
          return circleLoading();
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final character = snapshot.data![index];
            return ListTile(
              onTap: () {
                //cerrar el teclado
                FocusScope.of(context).unfocus();
                GoRouter.of(context)
                    .go('/character', extra: {'character': character});
              },
              title: Text(character.name!),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(character.image!),
              ),
            );
          },
        );
      },
    );
  }
}
