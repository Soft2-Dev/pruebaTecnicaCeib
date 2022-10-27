import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/get_usuarios.dart';
import '../widget/cart_items.dart';

class Listas {
  getUsuarios(GetUsuariosPrivider provider) {
    List<Widget> itemMap = (provider.usuarios.isNotEmpty)
        ? provider.usuarios
            .map(
              (e) => CardItems(
                  nombre: e.name!, correo: e.email!, telefono: e.phone!),
            )
            .toList()
        : provider.usuarios
            .map((e) => Container(
                  child: CircularProgressIndicator(color: Color(0xff285E2B)),
                ))
            .toList();

    return itemMap;
  }
}
