import 'package:flutter/material.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';

class NormalText extends StatelessWidget {

  final String text;

  const NormalText({
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).extension<CustomColors>()!;

    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Comfortaa',
        color: colors.sourceText,
      ),
    );
  }
}
