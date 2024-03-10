import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color textColor;
  final double textSize;
  final double bottomSize;
  const DefaultButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.textSize = 20,
    this.bottomSize = 130,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: bottomSize,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: onPressed, // Correctly invoking the onPressed function
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
