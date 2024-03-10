import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType ?type;
  final Function? onSubmit;
  final Function? onChange;
  final Function? onTap;
  final bool isPassword;
  final Function ?validate; // Update the type here
  final String labelOfTextFormField;
  final IconData ?prefix;
  final IconData? suffix;
  final Function? suffixPressed;
  final bool isClickable;

  DefaultTextFormField({super.key,
     this.controller,
     this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    this.validate,
    required this.labelOfTextFormField,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Material(
        elevation: 15.0,
        shadowColor: Colors.black54,
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          enabled: isClickable,
          onFieldSubmitted: onSubmit as void Function(String)?,
          onChanged: onChange as void Function(String)?,
          onTap: onTap as void Function()?,
          validator: validate as String? Function(String?)?,
          decoration: InputDecoration(
            labelText: labelOfTextFormField,
            prefixIcon: Icon(
              prefix,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed as void Function()?,
                    icon: Icon(
                      suffix,
                    ),
                  )
                : null,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}