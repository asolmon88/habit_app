import 'package:flutter/material.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';

class CustomImageButton extends StatelessWidget {

  final String path;
  final void Function()? onTap;

  const CustomImageButton({
    super.key,
    required this.path,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).extension<CustomColors>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color:colors.onText!),
          borderRadius: BorderRadius.circular(15),
          color: colors.sourceText!.withAlpha(180),
        ),
        child: Image.asset(path, height: 40,),
      ),
    );
  }
}