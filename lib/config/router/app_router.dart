import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_app/presentation/bloc.dart';
import 'package:habit_app/presentation/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/presentation/screens/register_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final isAuth = context.read<AuthCubit>().state.isAuth;
    final isCreatingAccount = context.read<AuthCubit>().state.isCreatingAccount;
    if (!isAuth && !isCreatingAccount) {
      return '/addHabit';
    } else {
      return null;
    }
  },
  routes: [
    GoRoute(
      path: '/',
      builder:(context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder:(context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder:(context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/dailyHabits',
      builder:(context, state) => const HabitsScreen(
        title: 'Daily Habits',
      ),
    ),
    GoRoute(
      path: '/monthlyHabits',
      builder:(context, state) => const HabitsScreen(
        title: 'Montly Habits',
      ),
    ),
    GoRoute(
      path: '/yearlyHabits',
      builder:(context, state) => const HabitsScreen(
        title: 'Yearly Habits',
      ),
    ),
    GoRoute(
      path: '/addHabit',
      builder:(context, state) => AddModifyHabitScreen(),
    ),
  ]
);