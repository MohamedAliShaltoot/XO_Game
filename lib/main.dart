import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/core/app_constants.dart';
import 'package:xo_game/core/theme.dart';
import 'package:xo_game/firebase_options.dart';
import 'package:xo_game/to_do_using_firebase/features/home_screen/home-screen.dart';
import 'package:xo_game/to_do_using_firebase/features/home_screen/spalsh_screen.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const XOGAME());
}

class XOGAME extends StatelessWidget {
  const XOGAME({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      initialRoute: SplashScreen.routeName,

      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen()
      },
//home: const SplashScreen(),
    );
  }
}


