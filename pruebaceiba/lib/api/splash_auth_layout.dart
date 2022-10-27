import 'package:flutter/material.dart';
import 'package:pruebaceiba/pages/detalle_page.dart';

import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SplashScreenView(
      navigateRoute: DetallePage(),
      // backgroundColor: Color(0xffc330d1),
      duration: 4000,
      imageSize: 400,
      imageSrc: "img/splas3.png",
      textType: TextType.NormalText,
      textStyle: const TextStyle(
        fontSize: 30.0,
      ),
    );
  }
}
