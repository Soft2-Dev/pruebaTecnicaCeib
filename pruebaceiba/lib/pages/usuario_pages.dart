import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/get_usuarios.dart';
import '../serices/localStorage.dart';
import '../widget/card_post.dart';


class UsuarioPages extends StatefulWidget {
  const UsuarioPages({Key? key}) : super(key: key);

  @override
  State<UsuarioPages> createState() => _UsuarioPagesState();
}

class _UsuarioPagesState extends State<UsuarioPages> {
  @override
  void initState() {
    Provider.of<GetUsuariosPrivider>(context, listen: false).getPostUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const color = Color(0xff285E2B);
    final provider = Provider.of<GetUsuariosPrivider>(context);
    final nombre = LocalStorage.prefs.getString('nombre');
    final telefono = LocalStorage.prefs.getString('telefono');
    final correo = LocalStorage.prefs.getString('correo');

    List<Widget> itemMap = (provider.posts.isNotEmpty)
        ? provider.posts
            .map(
              (e) => CardPosts(color: color, title: e.title!, body: e.body!),
            )
            .toList()
        : provider.usuarios
            .map((e) => const CircularProgressIndicator(color: color))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts de $nombre'),
      ),
      body: Column(
        children: [
          _Datos(nombre: nombre, telefono: telefono, correo: correo),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [...itemMap],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Datos extends StatelessWidget {
  const _Datos({
    Key? key,
    required this.nombre,
    required this.telefono,
    required this.correo,
  }) : super(key: key);

  final String? nombre;
  final String? telefono;
  final String? correo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black38, offset: Offset(1, 1), blurRadius: 3)
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nombre!,
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
              Text(telefono!)
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
              Text(correo!)
            ],
          ),
        ],
      ),
    );
  }
}
