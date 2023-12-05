import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    // List<Map<String, dynamic>> monthlyHabits = [];
    // List<Map<String, dynamic>> yearlyHabits = [];
    FirestoreService().getHabits(collectionPath)
    .then((value) {
      dailyHabits = value.docs[0].data();
    }).then((value) {
      emit(
        state.copywith(
          isLoading: false,
          dailyHabits: dailyHabits,
          monthlyHabits: {},
          yearlyHabits: {},
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
      await FirestoreService().updateHabit(email, habitType, habitName, data);
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
