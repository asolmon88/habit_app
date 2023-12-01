import 'package:flutter/material.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/presentation/widgets.dart';

class HabitsScreen extends StatefulWidget {
  final String title;
  final double value;
  final Map<String, dynamic>? habits;
  final void Function()? onTapAdd;
  final void Function()? onTapEdit;

  const HabitsScreen({
    super.key,
    this.title = '',
    this.value = 0,
    this.habits,
    this.onTapAdd,
    this.onTapEdit
  });

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: widget.onTapAdd,
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: colors.sourceCard,
                          fontSize: 17
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTapEdit,
                      child: Text(
                        'Edit',
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
                  value: widget.value,
                ),
                HabitsList(
                  rowCount: (widget.habits!.keys.length/2).ceil(),
                  habits: widget.habits,
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
