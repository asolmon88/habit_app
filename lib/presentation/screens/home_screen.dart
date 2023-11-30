import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/presentation/bloc.dart';
import 'package:habit_app/presentation/bloc/cubit/habits_cubit.dart';
import 'package:habit_app/presentation/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HabitsCubit>().getHabits(
      'ariel@hotmail.com'
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).extension<CustomColors>()!;

    // final email = context.watch<AuthCubit>().state.email;
    final name = context.watch<AuthCubit>().state.name;
    // final lastname = context.watch<AuthCubit>().state.lastname;

    final dailyHabits = (context.watch<HabitsCubit>().state.dailyHabits)[0];

    final rowCount = (dailyHabits.keys.length/2).ceil();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, $name',
          style: const TextStyle(
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
                  value: 0.65,
                ),
                const SizedBox(height: 15,),
                const PeriodHabitCard(
                  title: 'Montly habits',
                  value: 0.3,
                ),
                const SizedBox(height: 15,),
                const PeriodHabitCard(
                  title: 'Yearly habits',
                  value: 0.9,
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
                  columnCount: 2,
                  habits: dailyHabits,
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}