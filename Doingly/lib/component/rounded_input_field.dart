import 'package:flutter/material.dart';
import 'input_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key, required this.hintText,
     this.icon = Icons.person,
    required this.onChanged, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextfieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
        icon: Icon(icon, color: Colors.white,),
      hintText: hintText,
      border: InputBorder.none,
      ),
      ),
      );
  }
}

