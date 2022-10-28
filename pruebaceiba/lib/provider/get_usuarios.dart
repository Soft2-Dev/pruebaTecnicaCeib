import 'package:flutter/material.dart';
import 'package:pruebaceiba/modelo/modelo_usuarios.dart';

import '../api/AllApi.dart';
import '../modelo/modelo_post.dart';
import '../serices/localStorage.dart';

class GetUsuariosPrivider extends ChangeNotifier {
  List<Usuario> usuarios = [];
  List<Post> posts = [];

  getUsuarios() async {
    String url = '/users';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final Usuarios usuarios = Usuarios.fromlist(resp);
    print(usuarios.dato[0].name);
    this.usuarios = usuarios.dato;
    notifyListeners();
  }

  getPostUsuarios() async {
    final id = LocalStorage.prefs.getString('id');
    String url = '/posts?userId=$id';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final Posts posts = Posts.fromlist(resp);
    print(posts.dato[0].userId);
    this.posts = posts.dato;
    notifyListeners();
  }
}
