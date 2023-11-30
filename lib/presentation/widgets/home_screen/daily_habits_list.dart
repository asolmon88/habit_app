import 'package:flutter/material.dart';
import 'package:habit_app/presentation/widgets.dart';

class DailyHabitsList extends StatelessWidget {

  final int rowCount;
  final int columnCount;
  final Map<String, dynamic>? habits;

  const DailyHabitsList({
    super.key,
    this.rowCount = 1,
    this.columnCount = 2,
    this.habits,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        rowCount,
        (rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              columnCount,
              (columnIndex) {
                final index = rowIndex * columnCount + columnIndex;
                if (habits != null) {
                  if (index != habits!.length) {
                    final title = habits!.keys.elementAt(index);
                    final currentHabit = habits![title];
                    return Flexible(
                      child: HabitCard(
                        title: title,
                        value: int.parse(currentHabit['current_value'])
                              /int.parse(currentHabit['end_value']),
                        endValue: currentHabit['end_value'],
                        currentValue: currentHabit['current_value'],
                        metric: currentHabit['metric'],
                      ),
                    );
                  } else {
                    return const Expanded(child: SizedBox());
                  }
                } else {
                  return const Text('All done for today!');
                }
              }
            ),
          );
        }
      ),
    );
  }
}
