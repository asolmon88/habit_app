import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_app/presentation/bloc.dart';
import 'package:habit_app/presentation/widgets.dart';

class HomeScreen extends StatefulWidget {

  final String user;

  const HomeScreen({
    super.key,
    required this.user,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HabitsCubit>().getHabits(
      context.read<AuthCubit>().state.email
    );
  }

  @override
  Widget build(BuildContext context) {

    return context.watch<HabitsCubit>().state.isLoading ?
      const LoadingCircle() :
      const UserHabitsDetails();
  }
}