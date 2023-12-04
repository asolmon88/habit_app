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

  const HabitsScreen({
    super.key,
    this.title = '',
    this.edit = false,
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
                      onTap: () => context.push('/addHabit'),
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
                  value: calculateProgress(
                    (context.watch<HabitsCubit>().state.dailyHabits)[0]
                  ),
                ),
                HabitsList(
                  rowCount: (
                    (context.watch<HabitsCubit>().state.dailyHabits)[0]
                    .keys.length/2).ceil(),
                  habits: (context.watch<HabitsCubit>().state.dailyHabits)[0],
                  edit: _edit,
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
