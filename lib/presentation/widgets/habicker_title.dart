import 'package:flutter/material.dart';
import './normal_text.dart';

class HabickerTitle extends StatelessWidget {
  final String lowerText;

  const HabickerTitle({
    super.key,
    this.lowerText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Habicker',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 45,
            shadows: [
                Shadow(
                offset: const Offset(3.0, 3.0),
                blurRadius: 5.0,
                color: Colors.black.withOpacity(1),
              ),
            ]
          ),
        ),
        NormalText(text: lowerText),
      ],
    );
  }
}
