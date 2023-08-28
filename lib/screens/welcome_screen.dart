import 'package:flutter/material.dart';

import 'authentification_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 300),
          const Center(
            child: Text(
              "Bienvenue dans ASCC",
              style: TextStyle(
                color: Colors.purple,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 0.5,
                //decorationStyle: TextDecorationStyle.dashed
              ),
            ),
          ),
          const SizedBox(width: 190,height: 280, ),
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthentificationScreen(),
                    ),
                        (route) => false);
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                      'Cliquez ici pour continuer',
                    style: TextStyle(
                      color: Colors.purple
                    ),
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    color: Colors.purple,
                    size: 40,
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
