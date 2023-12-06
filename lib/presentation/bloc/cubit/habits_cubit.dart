
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_app/infrastructure/services/firestore_service.dart';

part 'habits_state.dart';

class HabitsCubit extends Cubit<HabitsState> {
  HabitsCubit() : super(const HabitsState());

  void getHabits(String collectionPath) {
    emit(
      state.copywith(
        isLoading: true,
        dailyHabits: {},
        monthlyHabits: {},
        yearlyHabits: {},
      )
    );
    Map<String, dynamic> dailyHabits = {};
    Map<String, dynamic> monthlyHabits = {};
    Map<String, dynamic> yearlyHabits = {};
    FirestoreService().getHabits(collectionPath)
    .then((value) {
      dailyHabits = value.docs[0].data();
      monthlyHabits = value.docs[1].data();
      yearlyHabits = value.docs[2].data();
    }).then((value) {
      emit(
        state.copywith(
          isLoading: false,
          dailyHabits: dailyHabits,
          monthlyHabits: monthlyHabits,
          yearlyHabits: yearlyHabits,
        )
      );
    },);
  }

  Future<void> addHabit(String collectionPath, String document, String name,
    String currentValue, String endValue, String metric, bool status)
  async {
    await FirestoreService().addHabit(collectionPath, document, name,
    currentValue, endValue, metric, status);
    getHabits(collectionPath);
  }

  Future<void> updateHabit(String email, String habitType,
    String habitName, String data) async {
    emit(
      state.copywith(
        isLoading: true,
      )
    );
    try {
      await FirestoreService().updateHabit(
        email, habitType, habitName, data);
      getHabits(email);
    } catch (e) {
      emit(
        state.copywith(
          isLoading: false,
          error: true,
          errorMessage: e.toString(), 
        )
      );
    }
  }

  Future<void> completeHabit(String email, String habitType,
    String habitName, String data, Map<String, dynamic> pastDates) async {
    emit(
      state.copywith(
        isLoading: true,
      )
    );
    try {
      await FirestoreService().completeHabit(
        email, habitType, habitName, data, pastDates);
      getHabits(email);
    } catch (e) {
      emit(
        state.copywith(
          isLoading: false,
          error: true,
          errorMessage: e.toString(), 
        )
      );
    }
  }
}
