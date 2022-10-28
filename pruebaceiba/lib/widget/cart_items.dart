import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/get_usuarios.dart';
import '../serices/localStorage.dart';

class CardItems extends StatelessWidget {
  final String id;
  final String nombre;
  final String telefono;
  final String correo;
  const CardItems({
    Key? key,
    required this.nombre,
    required this.telefono,
    required this.correo,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LocalStorage.prefs.setString('id', id);
        LocalStorage.prefs.setString('nombre', nombre);
        LocalStorage.prefs.setString('telefono', telefono);
        LocalStorage.prefs.setString('correo', correo);
        Navigator.pushNamed(context, 'UsuarioPages');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 18),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black38, offset: Offset(1, 1), blurRadius: 3)
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombre,
              style: const TextStyle(
                  color: Color(0xff285E2B),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(
              width: 2,
            ),
            Row(
              children: [
                const Icon(
                  Icons.call,
                  color: Color(0xff285E2B),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(telefono)
              ],
            ),
            const SizedBox(
              width: 2,
            ),
            Row(
              children: [
                const Icon(
                  Icons.mail,
                  color: Color(0xff285E2B),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(correo)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: const Text(
                'VER PUBLICACIONES',
                style: TextStyle(
                    color: Color(0xff285E2B), fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
