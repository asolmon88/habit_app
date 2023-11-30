import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_app/infrastructure/services/firestore_service.dart';
// import 'package:login_firebase/infrastructure/services/google_auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> signInUser(String email, String password) async {
    emit(
      state.copywith(isLoading: true)
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      final user = FirebaseAuth.instance.currentUser!;
      final userData = await FirestoreService().getUserData('users',
        email);
      emit(
        state.copywith(
          isAuth: true,
          isLoading: false,
          email: user.email,
          name: userData.data()!['name'],
          lastname: userData.data()!['lastname'],
        )
      );
    } on FirebaseException catch(e) {
      emit(
        state.copywith(
          isLoading: false,
          error: true,
          errorMessage: e.code,
        )
      );
    }
  }

  Future<void> signUpUser(String email, String password, String name,
    String lastname) async {
    emit(
      state.copywith(isLoading: true),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );

      await FirestoreService().createUserData(
        'users',
        email,
        name,
        lastname
      );

      final user = FirebaseAuth.instance.currentUser!;
      final userData = await FirestoreService().getUserData('users',
        email);

      emit(
        state.copywith(
          isLoading: false,
          isAuth: true,
          isCreatingAccount: false,
          email: user.email,
          name: userData.data()!['name'],
          lastname: userData.data()!['lastname'],
        )
      );
    } on FirebaseAuthException catch(e) {
      emit(
        state.copywith(
          isLoading: false,
          isAuth: false,
          error: true,
          errorMessage: e.code
        )
      );
    }
  }

  // Future<void> signInToGoogleUser() async {
  //   emit(
  //     state.copywith(isLoading: true)
  //   );
  //   try {
  //     await GoogleAuthService().signInGoogle();
  //     final user = FirebaseAuth.instance.currentUser!;
  //     DocumentSnapshot<Map<String, dynamic>> userData = 
  //       await FirestoreService().getUserData('users',
  //       user.email!);
      
  //     if (!userData.exists) {
  //       await FirestoreService().createUserData(
  //         'users',
  //         user.email!,
  //         user.email!.split('@')[0],
  //         'Biografía vacía'
  //       );
  //       userData = await FirestoreService().getUserData('users',
  //       user.email!);
  //     }

  //     emit(
  //       state.copywith(
  //         isLoading: false,
  //         isAuth: true,
  //         isCreatingAccount: false,
  //         email: user.email,
  //         username: userData.data()!['username'],
  //         bio: userData.data()!['bio'],
  //       )
  //     );
  //   } catch (e) {
  //     emit(
  //       state.copywith(
  //         isLoading: false,
  //         isAuth: false,
  //         error: true,
  //         errorMessage: "Algo salió mal al ingresar con la cuenta de Google",
  //       )
  //     );
  //   }
  // }

  // Future<void> updateUserData(String email, String field, String data) async {
  //   emit(
  //     state.copywith(
  //       isLoading: true,
  //     )
  //   );
  //   try {
  //     await FirestoreService().updateUserData('users', email, field, data);
  //     final userData = await FirestoreService().getUserData('users',
  //       email);
  //     emit(
  //       state.copywith(
  //         isLoading: false,
  //         username: userData.data()!['username'],
  //         bio: userData.data()!['bio'],
  //       )
  //     );
  //   } catch (e) {
  //     emit(
  //       state.copywith(
  //         isLoading: false,
  //         error: true,
  //         errorMessage: e.toString(), 
  //       )
  //     );
  //   }
  // }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
    FirestoreService().clear();
    emit(const AuthState());
  }

  void isCreatingAccount() {
    emit(
      state.copywith(
        isCreatingAccount: true,
        error: false,
        errorMessage: "",
      )
    );
  }

  void reset() {
    emit(const AuthState());
  }
}

