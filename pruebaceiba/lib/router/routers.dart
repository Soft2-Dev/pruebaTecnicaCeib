import 'package:flutter/material.dart';

import '../api/construcion_page.dart';
import '../api/splash_auth_layout.dart';
import '../pages/home_pages.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    'splas': (BuildContext context) => SplashScreenPage(),
    'DetallePage': (BuildContext context) => HomePage(),
  };
}

Map<String, WidgetBuilder> getNoRutas() {
  return <String, WidgetBuilder>{
    'construccion': (BuildContext context) => Construccion(),
  };
}
