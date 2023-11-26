import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  final String textlisttile;
  final IconData icontext;
  const Listtile(
      {super.key, required this.icontext, required this.textlisttile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(textlisttile),
      leading: Icon(icontext),
      onTap: () {},
    );
  }
}
