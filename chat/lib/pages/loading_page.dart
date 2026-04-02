import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Theme.of(
                context,
              ).primaryTextTheme.headlineLarge?.color,
            ),
            SizedBox(height: 10),
            Text(
              'Carregando',
              style: TextStyle(
                color: Theme.of(context).primaryTextTheme.headlineLarge?.color,
                fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
