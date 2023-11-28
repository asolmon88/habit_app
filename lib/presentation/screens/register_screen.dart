import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/presentation/widgets.dart';
import 'package:habit_app/presentation/bloc.dart';
import 'package:go_router/go_router.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();

  void signUp(BuildContext context, AuthCubit authCubit) {
    if (_passwordController.text == _confirmPasswordController.text) {
      authCubit.signUpUser(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
        _lastnameController.text,
      ).then(
        (value) {
          if(authCubit.state.error) {
            showDialog(
              context: context,
              builder: (context) {
                String e = authCubit.state.errorMessage;
                authCubit.isCreatingAccount();
                return AlertDialog(
                  title: Text(e),
                );
              }
            );
          } else {
            context.go('/');
          }
        }
      );
    } else {
      showDialog(
        context: context,
        builder:  (context) {
          return const AlertDialog(
            title: Text("Contraseña no coincide"),
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    final authCubit = context.watch<AuthCubit>();

    return Scaffold(
      backgroundColor: colors.sourceBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 60,),
                  const HabickerTitle(
                    lowerText: 'The new you starts here',
                  ),
                  const SizedBox(height: 25),

                  CustomTextField(
                    hintText: 'Correo',
                    controller: _emailController,
                  ),
                  const SizedBox(height: 25),

                  CustomTextField(
                    hintText: 'Contraseña',
                    controller: _passwordController,
                    obscuredText: true,
                  ),
                  const SizedBox(height: 25),

                  CustomTextField(
                    hintText: 'Confirmar contraseña',
                    controller: _confirmPasswordController,
                    obscuredText: true,
                  ),
                  const SizedBox(height: 25),

                  CustomTextField(
                    hintText: 'Name',
                    controller: _nameController,
                  ),
                  const SizedBox(height: 25),

                  CustomTextField(
                    hintText: 'Last Name',
                    controller: _lastnameController,
                  ),
                  const SizedBox(height: 25),

                  CustomButton(
                    title: 'Create account',
                    onTap: () => signUp(context, authCubit),
                  ),
                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(color: colors.sourceText),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: (){
                          authCubit.reset();
                          context.go('/');
                        },
                        child: Text(
                          'Login!',
                          style: TextStyle(
                            color: colors.sourceCard,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      )
                    ],
                  )
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}
