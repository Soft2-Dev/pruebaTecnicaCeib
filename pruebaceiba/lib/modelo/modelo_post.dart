class Posts {
  List<Post> dato = [];
  Posts();

  Posts.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = Post.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Post {
  String? userId;
  String? id;
  String? title;
  String? body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Post.fromJsonMap(Map<String, dynamic> datos) {
    userId = datos['userId'].toString();
    id = datos['id'].toString();
    title = datos['title'];
    body = datos['body'];
  }
}
