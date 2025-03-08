import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            const Text("It looks like you are not logged in", style: TextStyle(fontSize: 20)),
            const Text("Do it so we can give you a more personalized experience."),
            TextButton(
              child: const Text("Login in"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
