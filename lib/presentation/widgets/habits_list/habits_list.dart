import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/presentation/bloc.dart';
import 'package:habit_app/presentation/widgets.dart';

class HabitsList extends StatefulWidget {

  final int rowCount;
  final int columnCount;
  final Map<String, dynamic>? habits;
  final bool edit;

  const HabitsList({
    super.key,
    this.rowCount = 1,
    this.columnCount = 2,
    this.habits,
    this.edit = false,
  });

  @override
  State<HabitsList> createState() => _HabitsListState();
}

class _HabitsListState extends State<HabitsList> {
  void editProgress(
    String habitName, HabitsCubit habitsCubit, String email,
    String endValue, String currentValue
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const TitleText(title: 'Edit Exercise'),
          content: EditForm(
            currentValue: currentValue,
            endValue: endValue,
            onPressedSave: (value) {
              habitsCubit.updateHabit(email, 'daily_habits',
                  habitName, value);
              context.pop();
            },
            onPressedComplete: () {
              habitsCubit.updateHabit(email, 'daily_habits',
                habitName, endValue);
              context.pop();
            }
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final habitsCubit = context.watch<HabitsCubit>();

    return Column(
      children: List.generate(
        widget.rowCount,
        (rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.columnCount,
              (columnIndex) {
                final index = rowIndex * widget.columnCount + columnIndex;
                if (widget.habits != null && widget.habits!.isNotEmpty) {
                  if (index != widget.habits!.length) {
                    final title = widget.habits!.keys.elementAt(index);
                    final currentHabit = widget.habits![title];
                    return Flexible(
                      child: HabitCard(
                        title: title,
                        value: int.parse(currentHabit['current_value'])
                              /int.parse(currentHabit['end_value']),
                        endValue: currentHabit['end_value'],
                        currentValue: currentHabit['current_value'],
                        metric: currentHabit['metric'],
                        edit: widget.edit,
                        onTap: () => editProgress(title, habitsCubit,
                          context.read<AuthCubit>().state.email,
                          currentHabit['end_value'],
                          currentHabit['current_value']),
                      ),
                    );
                  } else {
                    return const Expanded(child: SizedBox());
                  }
                } else {
                  return widget.habits!.isEmpty ?
                  const Text('No habits added') :
                  const Text('All done!');
                }
              }
            ),
          );
        }
      ),
    );
  }
}
