part of 'habits_cubit.dart';

class HabitsState extends Equatable {

  final bool isLoading;
  final bool error;
  final String errorMessage;

  final List<Map<String, dynamic>> dailyHabits;
  final List<Map<String, dynamic>> monthlyHabits;
  final List<Map<String, dynamic>> yearlyHabits;

  const HabitsState({
    this.isLoading = false,
    this.error = false,
    this.errorMessage = '',
    this.dailyHabits = const [],
    this.monthlyHabits = const [],
    this.yearlyHabits = const [],
  });

  HabitsState copywith({
    bool? isLoading,
    bool? error,
    String? errorMessage,
    List<Map<String, dynamic>>? dailyHabits,
    List<Map<String, dynamic>>? monthlyHabits,
    List<Map<String, dynamic>>? yearlyHabits,

  }) => HabitsState(
    isLoading: isLoading ?? this.isLoading,
    error: error ?? this.error,
    errorMessage: errorMessage ?? this.errorMessage,
    dailyHabits: dailyHabits ?? this.dailyHabits,
    monthlyHabits: monthlyHabits ?? this.monthlyHabits,
    yearlyHabits: yearlyHabits ?? this.yearlyHabits,
  );

  @override
  List<Object> get props => [isLoading, dailyHabits, monthlyHabits,
    error, errorMessage];
}
