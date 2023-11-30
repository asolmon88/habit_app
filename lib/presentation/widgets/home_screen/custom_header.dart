import 'package:flutter/material.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';

class CustomHeader extends StatefulWidget {

  final String leftText;
  final String rightText;

  const CustomHeader({
    super.key,
    this.leftText = '',
    this.rightText = '',
  });

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {

  bool _selected = true;

  void onTap(int button) {
    setState(() {
      _selected = button == 1 ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).extension<CustomColors>()!;

    return Row(
      children: [
        GestureDetector(
          onTap: () => onTap(1),
          child: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: _selected == true ? colors.onButton : colors.sourceButton,
            ),
            width: MediaQuery.of(context).size.width/2-15,
            child: Center(
              child: Text(
                widget.leftText,
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  color: colors.sourceText,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onTap(0),
          child: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: _selected == true ? colors.sourceButton : colors.onButton,
            ),
            width: MediaQuery.of(context).size.width/2-15,
            child: Center(
              child: Text(
                widget.rightText,
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  color: colors.sourceText,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
