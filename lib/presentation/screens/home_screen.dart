import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/presentation/widgets.dart';
import 'package:habit_app/presentation/widgets/custom_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, Name'),
        toolbarHeight: 80,
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                CustomHeader(
                  leftText: 'TODAY',
                  rightText: 'STATISTICS',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}