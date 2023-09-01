// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
  final int itemIndex;
  final String urlImg;

  const ContainerImage({super.key, 
    required this.itemIndex,
    required this.urlImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Hero(
          tag: itemIndex,
          child: FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
            image: NetworkImage(urlImg),
          ),
        ),
      ),
    );
  }
}
