import 'package:flutter/material.dart';
import 'package:pruebaceiba/modelo/modelo_usuarios.dart';

import '../api/AllApi.dart';

class GetUsuariosPrivider extends ChangeNotifier {
  List<Usuario> usuarios = [];


  getUsuarios() async {
    String url = '/users';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final Usuarios usuarios = Usuarios.fromlist(resp);
    print(usuarios.dato[0].name);
    if (usuarios.dato[0].name!='') {
      
    }

    this.usuarios = usuarios.dato;

    notifyListeners();
  }
}
