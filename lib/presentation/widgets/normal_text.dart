import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {

  final String text;

  const NormalText({
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Comfortaa'
      ),
    );
  }
}
