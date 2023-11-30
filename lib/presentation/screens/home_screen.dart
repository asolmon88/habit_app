import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/presentation/widgets.dart';
import 'package:habit_app/presentation/widgets/home_screen/daily_habits_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).extension<CustomColors>()!;
    final rowCount = 1;
    final columnCount = 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome, Name',
          style: TextStyle(
            fontWeight: FontWeight.w500
          ),
        ),
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomHeader(
                  leftText: 'TODAY',
                  rightText: 'STATISTICS',
                ),
                const SizedBox(height: 50,),
                const PeriodHabitCard(
                  title: 'Daily habits',
                  value: 0.3,
                ),
                const SizedBox(height: 50,),
                Row(
                  children: [
                    Text(
                      'Remaining today',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 15,
                        color: colors.sourceText,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        'Show all',
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 15,
                          color: colors.sourceCard,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                DailyHabitsList(
                  rowCount: rowCount,
                  columnCount: columnCount,
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}