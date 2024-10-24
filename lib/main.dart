import 'package:flutter/material.dart';
import 'package:xo_game/loginscreen.dart';
import 'package:xo_game/xo_game_screen.dart';

void main() {
  runApp(const XOGAME());
}

class XOGAME extends StatelessWidget {
  const XOGAME({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XOGAME',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.routeName ,

      routes: {
LoginScreen.routeName:(context) => const LoginScreen(),
XoGameScreen.routeName:(context) => const XoGameScreen()

      },
    );
  }
}


