import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/presentation/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "login",
      onTap: () => context.go('/login'),
    );
  }
}