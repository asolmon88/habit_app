import 'package:flutter/material.dart';
import 'package:habit_app/presentation/widgets.dart';

class DailyHabitsList extends StatelessWidget {

  final int rowCount;
  final int columnCount;

  const DailyHabitsList({
    super.key,
    this.rowCount = 1,
    this.columnCount = 2,
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
                return const Flexible(
                  child: HabitCard(
                    title: 'Drink Water',
                    value: 0.7,
                    endValue: 3000,
                    currentValue: 2000,
                    metric: 'ml',
                  ),
                );
              }
            ),
          );
        }
      ),
    );
  }
}
