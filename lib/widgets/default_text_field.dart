import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 10),
      child: TextField(
        cursorColor: Colors.purple,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          labelStyle: const TextStyle(color: Colors.black54),
          suffixIcon: const Icon(Icons.search,),
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
          suffixIconColor: Colors.grey

        ),
      ),
    );
  }
}
