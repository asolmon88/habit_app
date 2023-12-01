import 'package:flutter/material.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';

class PeriodHabitCard extends StatelessWidget {

  final double? elevation;
  final String? title;
  final double? value;
  final void Function()? onTap;

  const PeriodHabitCard({
    super.key,
    this.elevation,
    this.title,
    this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).extension<CustomColors>()!;

    return Card(
      color: colors.sourceCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title!,
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  color: colors.sourceText,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                    'Progress',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: colors.sourceBackground,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: LinearProgressIndicator(
                      color: colors.sourceBackground,
                      backgroundColor: colors.sourceText,
                      value: value,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}