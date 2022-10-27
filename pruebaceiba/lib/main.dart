import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebaceiba/provider/usuarios_from_provider.dart';

import 'api/AllApi.dart';
import 'api/construcion_page.dart';
import 'api/splash_auth_layout.dart';

import 'provider/get_usuarios.dart';
import 'router/routers.dart';
import 'serices/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AllApi.configuteDio();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        // --------- provider login --------------
        ChangeNotifierProvider(
            lazy: false, create: (_) => GetUsuariosPrivider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => UsuariosFromProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba de Ingreso',
      home: const SplashScreenPage(),
      initialRoute: 'splas',
      routes: getRutas(),
      scaffoldMessengerKey: NotificationService.msnKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => Construccion());
      },
      theme: ThemeData().copyWith(
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: const Color(0xff285E2B)),
        errorColor: const Color(0xff285E2B),
      ),
    );
  }
}
