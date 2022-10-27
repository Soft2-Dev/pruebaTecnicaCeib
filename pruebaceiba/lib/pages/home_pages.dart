import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/get_usuarios.dart';
import '../provider/usuarios_from_provider.dart';
import '../widget/cart_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<GetUsuariosPrivider>(context, listen: false).getUsuarios();
    super.initState();
  }

  final color = const Color(0xff285E2B);

  @override
  Widget build(BuildContext context) {
    final fromProvider = Provider.of<UsuariosFromProvider>(context);
    final provider = Provider.of<GetUsuariosPrivider>(context);
    final size = MediaQuery.of(context).size;
    
    List<Widget> itemMap = (provider.usuarios.isNotEmpty)
        ? provider.usuarios
            .map(
              (e) => CardItems(
                  nombre: e.name!, correo: e.email!, telefono: e.phone!),
            )
            .toList()
        : provider.usuarios
            .map((e) => Container(
                  child: CircularProgressIndicator(color: color),
                ))
            .toList();



    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff285E2B),
          title: const Text('Prueba de Ingreso'),
        ),
        body: Column(
          children: [
            _Buscar(),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: ListView(
                  children: [...itemMap],
                ),
              ),
            )
          ],
        ));
  }
}

class _Buscar extends StatelessWidget {
  const _Buscar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color(0xff285E2B);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextFormField(
            style: const TextStyle(
              color: color,
            ),
            decoration: const InputDecoration(
              labelStyle: TextStyle(
                color: color,
              ),
              hoverColor: color,
              label: Text('Buscar usuario'),
            )));
  }
}
