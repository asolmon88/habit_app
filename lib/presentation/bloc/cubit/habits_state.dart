part of 'habits_cubit.dart';

class HabitsState extends Equatable {

  final bool isLoading;

  final List<Map<String, dynamic>> dailyHabits;
  final List<Map<String, dynamic>> monthlyHabits;
  final List<Map<String, dynamic>> yearlyHabits;

  const HabitsState({
    this.isLoading = false,
    this.dailyHabits = const [],
    this.monthlyHabits = const [],
    this.yearlyHabits = const [],
  });

  HabitsState copywith({
    bool? isLoading,
    List<Map<String, dynamic>>? dailyHabits,
    List<Map<String, dynamic>>? monthlyHabits,
    List<Map<String, dynamic>>? yearlyHabits,

  }) => HabitsState(
    isLoading: isLoading ?? this.isLoading,
    dailyHabits: dailyHabits ?? this.dailyHabits,
    monthlyHabits: monthlyHabits ?? this.monthlyHabits,
    yearlyHabits: yearlyHabits ?? this.yearlyHabits,
  );

  @override
  List<Object> get props => [isLoading, dailyHabits, monthlyHabits];
}
