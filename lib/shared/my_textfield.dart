import 'package:flutter/material.dart';

class MYtextfield extends StatelessWidget {
  final String hinttext;
  final TextInputType textinputtype;
  final bool ispassword;
  final TextEditingController mycontroller;
  const MYtextfield(
      {super.key,
      required this.hinttext,
      required this.textinputtype,
      required this.ispassword,
      required this.mycontroller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: mycontroller,
      keyboardType: textinputtype,
      obscureText: ispassword,
      decoration: InputDecoration(
        hintText: hinttext,
        enabledBorder:
            OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
