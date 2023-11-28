part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isAuth;
  final bool isCreatingAccount;
  final bool isLoading;
  final bool error;
  final String errorMessage;

  final String email;
  final String name;
  final String lastname;

  const AuthState({
    this.isAuth = false,
    this.isCreatingAccount = false,
    this.isLoading = false,
    this.error = false,
    this.errorMessage = '',
    this.email = '',
    this.name = '',
    this.lastname = '',
  });

  AuthState copywith({
    bool? isAuth,
    bool? isCreatingAccount,
    bool? isLoading,
    bool? error,
    String? errorMessage,
    String? email,
    String? name,
    String? lastname,
  }) => AuthState(
    isAuth: isAuth ?? this.isAuth,
    isCreatingAccount: isCreatingAccount ?? this.isCreatingAccount,
    isLoading: isLoading ?? this.isLoading,
    error: error ?? this.error,
    errorMessage: errorMessage ?? this.errorMessage,
    email: email ?? this.email,
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
  );

  @override
  List<Object> get props => [
    isAuth, isCreatingAccount, isLoading, errorMessage,
    error, email, name, lastname
  ];
}

