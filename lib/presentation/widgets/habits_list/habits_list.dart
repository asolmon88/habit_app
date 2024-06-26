import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/presentation/bloc.dart';
import 'package:habit_app/presentation/widgets.dart';
import 'package:intl/intl.dart';

class HabitsList extends StatefulWidget {

  final int rowCount;
  final int columnCount;
  final Map<String, dynamic>? habits;
  final bool edit;
  final String habitType;

  const HabitsList({
    super.key,
    this.rowCount = 1,
    this.columnCount = 2,
    this.habits,
    this.edit = false,
    this.habitType = '',
  });

  @override
  State<HabitsList> createState() => _HabitsListState();
}

class _HabitsListState extends State<HabitsList> {
  String _habitType = '';

  @override
  void initState() {
    super.initState();
    _habitType = widget.habitType;
  }

  void editProgress(
    String habitName, HabitsCubit habitsCubit, String email,
    String endValue, String currentValue, String habitType
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const TitleText(title: 'Edit Habit'),
          content: EditForm(
            currentValue: currentValue,
            endValue: endValue,
            onPressedSave: (value) {
              habitsCubit.updateHabit(email, habitType,
                  habitName, value);
              context.pop();
            },
            onPressedComplete: () {
              Map<String, dynamic> pastDates = {};
              if (habitType == 'daily_habits') {
                pastDates = habitsCubit.state.dailyHabits[habitName]['past_dates'];
              } else if (habitType == 'monthly_habits') {
                pastDates = habitsCubit.state.monthlyHabits[habitName]['past_dates'];
              } else {
                pastDates = habitsCubit.state.yearlyHabits[habitName]['past_dates'];
              }
              pastDates.addAll({
                DateFormat('yyyy-MM-dd').format(DateTime.now()) : true
              });
              habitsCubit.completeHabit(email, habitType,
                habitName, endValue, pastDates);
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
      children: widget.habits == null || widget.habits!.isEmpty ?
      (widget.habits!.isEmpty ? [const Text('No habits added')] :
      [const Text('All done!')]) :
      List.generate(
        widget.rowCount,
        (rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.columnCount,
              (columnIndex) {
                final index = rowIndex * widget.columnCount + columnIndex;
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
                        currentHabit['current_value'],
                        _habitType),
                    ),
                  );
                } else {
                  return const Expanded(child: SizedBox());
                }
              }
            ),
          );
        }
      ),
    );
  }
}
