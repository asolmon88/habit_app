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
      return '/login';
    } else {
      return null;
    }
  },
  routes: [
    GoRoute(
      path: '/',
      builder:(context, state) => HomeScreen(
        user: context.read<AuthCubit>().state.email
      ),
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
        habitType: 'daily_habits',
      ),
    ),
    GoRoute(
      path: '/monthlyHabits',
      builder:(context, state) => const HabitsScreen(
        title: 'Montly Habits',
        habitType: 'monthly_habits',
      ),
    ),
    GoRoute(
      path: '/yearlyHabits',
      builder:(context, state) => const HabitsScreen(
        title: 'Yearly Habits',
        habitType: 'yearly_habits',
      ),
    ),
    GoRoute(
      path: '/addHabit/:habitType',
      name: 'addHabit',
      builder:(context, state) => AddHabitScreen(
        habitType: state.pathParameters['habitType'],
      ),
    ),
  ]
);