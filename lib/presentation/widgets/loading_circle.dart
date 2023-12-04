import 'package:flutter/material.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            SizedBox(
              width: 100,
              height: 100,
              child: Column(
                children: [
                  CircularProgressIndicator(
                    backgroundColor: colors.sourceBackground,
                    color: colors.sourceCard,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      color: colors.sourceButton,
                      fontFamily: 'Comfortaa',
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}