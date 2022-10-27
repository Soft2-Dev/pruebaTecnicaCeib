import 'package:flutter/material.dart';

import '../provider/usuarios_from_provider.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.size,
    required this.fromProvider,
  }) : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: const Icon(
              Icons.person_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.nombre = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Nombre',
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
