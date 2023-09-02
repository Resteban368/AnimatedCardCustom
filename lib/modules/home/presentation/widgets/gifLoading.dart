
import 'package:flutter/material.dart';

class GifLoading extends StatelessWidget {
  const GifLoading({super.key});
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
