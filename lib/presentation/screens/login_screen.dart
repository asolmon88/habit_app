import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/presentation/bloc.dart';
import 'package:habit_app/presentation/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signIn(BuildContext context, AuthCubit authCubit){
    authCubit.signInUser(
      _emailController.text,
      _passwordController.text
    ).then((value) {
      if (authCubit.state.error) {
        showDialog(
          context: context,
          builder: (context) {
            String e = authCubit.state.errorMessage;
            authCubit.reset();
            return AlertDialog(
              title: Text(e),
            );
          }
        );
      } else {
        context.go('/');
      }
    });
  }

  // void signInGoogle(BuildContext context, AuthCubit authCubit){
  //   authCubit.signInToGoogleUser().then(
  //     (value) {
  //       if (authCubit.state.error) {
  //         showDialog(
  //           context: context,
  //           builder: (context) {
  //             String e = authCubit.state.errorMessage;
  //             authCubit.reset();
  //             return AlertDialog(
  //               title: Text(e),
  //             );
  //           }
  //         );
  //       } else {
  //         context.go('/');
  //       }
  //   });
  // }

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
                    lowerText: 'Your habit tracking app',
                  ),
                  const SizedBox(height: 25),

                  CustomTextField(
                    hintText: 'Email',
                    controller: _emailController,
                  ),
                  const SizedBox(height: 25),

                  CustomTextField(
                    hintText: 'Password',
                    controller: _passwordController,
                    obscuredText: true,
                  ),
                  const SizedBox(height: 70),

                  CustomButton(
                    title: 'Login',
                    onTap: () => signIn(context, authCubit),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: colors.sourceText,
                        )
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Or sign in with',
                        style: TextStyle(color: colors.sourceCard),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: colors.sourceText,
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageButton(
                        path: 'lib/assets/images/google.png',
                        onTap: () {} //signInGoogle(context, authCubit),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: colors.sourceText),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          authCubit.isCreatingAccount();
                          context.go('/register');
                        },
                        child: Text(
                          'Register here!',
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

