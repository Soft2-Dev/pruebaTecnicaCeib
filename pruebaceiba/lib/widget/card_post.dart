import 'package:flutter/material.dart';

class CardPosts extends StatelessWidget {
  const CardPosts({
    Key? key,
    required this.color,
    required this.title,
    required this.body,
  }) : super(key: key);

  final Color color;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      margin:const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black38, offset: Offset(1, 1), blurRadius: 3)
      ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          body!,
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ]),
    );
  }
}
