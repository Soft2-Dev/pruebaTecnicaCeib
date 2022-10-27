class Usuarios {
  List<Usuario> dato = [];
  Usuarios();

  Usuarios.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = Usuario.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Usuario {
  String? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;

  Usuario({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  Usuario.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'].toString();
    name = datos['name'];
    username = datos['username'];
    email = datos['email'];
    phone = datos['phone'];
    website = datos['website'];
  }
}
