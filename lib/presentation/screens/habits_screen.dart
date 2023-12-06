import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/infrastructure/utils.dart';
import 'package:habit_app/presentation/bloc/cubit/habits_cubit.dart';
import 'package:habit_app/presentation/widgets.dart';

class HabitsScreen extends StatefulWidget {
  final String title;
  final bool edit;
  final String habitType;

  const HabitsScreen({
    super.key,
    this.title = '',
    this.edit = false,
    this.habitType = '',
  });

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  
  bool _edit = false;

  void onTapEdit() {
    setState(() {
      _edit = !_edit;
    });
  }

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> habits = {};
    if (widget.habitType == 'daily_habits') {
      habits = context.watch<HabitsCubit>().state.dailyHabits;
    } else if (widget.habitType == 'monthly_habits') {
      habits = context.watch<HabitsCubit>().state.monthlyHabits;
    } else {
      habits = context.watch<HabitsCubit>().state.yearlyHabits;
    }

    final colors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
      ),
      body: context.watch<HabitsCubit>().state.isLoading ?
      const LoadingCircle() :
      SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _edit == false ? GestureDetector(
                      onTap: () => context.pushNamed(
                        'addHabit',
                        pathParameters: {'habitType': widget.habitType}
                      ),
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: colors.sourceCard,
                          fontSize: 17
                        ),
                      ),
                    ) : const SizedBox(),
                    GestureDetector(
                      onTap: onTapEdit,
                      child: Text(
                        _edit == false ? 'Edit' : 'Done',
                        style: TextStyle(
                          color: colors.sourceCard,
                          fontSize: 17
                        ),
                      ),
                    ),
                  ],
                ),
                PeriodHabitCard(
                  title: widget.title,
                  value: calculateProgress(habits),
                ),
                HabitsList(
                  rowCount: (
                    habits
                    .keys.length/2).ceil(),
                  habits: habits,
                  edit: _edit,
                  habitType: widget.habitType,
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
