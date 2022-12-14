import 'package:flutter/material.dart';
import 'package:pruebaceiba/pages/home_pages.dart';

import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SplashScreenView(
      navigateRoute: HomePage(),
      // backgroundColor: Color(0xffc330d1),
      duration: 200,
      imageSize: 70,
      imageSrc: "img/logo.png",
      textType: TextType.NormalText,
      textStyle: const TextStyle(
        fontSize: 30.0,
      ),
    );
  }
}
