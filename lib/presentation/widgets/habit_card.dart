import 'package:flutter/material.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';

class HabitCard extends StatelessWidget {

  final double? elevation;
  final String? title;
  final double? value;
  final String endValue;
  final String currentValue;
  final String? metric;
  final bool? edit;
  final void Function()? onTap;

  const HabitCard({
    super.key,
    this.elevation,
    this.title,
    this.value,
    this.endValue = '',
    this.currentValue = '',
    this.metric,
    this.edit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).extension<CustomColors>()!;

    return Card(
      color: colors.sourceButton,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: GestureDetector(
          onTap: (){},
          child: SizedBox(
            width: 90,
            height: 114,
            child: Column(
              children: [
                Text(
                  title!,
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: colors.sourceText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: colors.sourceBackground,
                    backgroundColor: colors.sourceText,
                    value: value,
                  ),
                ),
                const SizedBox(height: 15,),
                edit == null ? Text(
                  '$currentValue/$endValue $metric',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 10,
                    color: colors.sourceText,
                  ),
                  textAlign: TextAlign.center,
                ) : const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        )
      ),
    );
  }
}