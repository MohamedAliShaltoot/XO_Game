import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/fire_base%20feature/login_screen.dart';
import 'package:xo_game/firebase_options.dart';
import 'package:xo_game/to_do_using_firebase/features/home_screen/home-screen.dart';
import 'package:xo_game/xo_features/xo_screens/xo_game_screen.dart';

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
      title: 'XOGAME',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: LoginScreenn.routeName,

      // routes: {
      //   LoginScreenn.routeName: (context) => const LoginScreenn(),
      //   XoGameScreen.routeName: (context) => const XoGameScreen()
      // },
home: const HomeScreen(),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:xo_game/new/dash.dart';
// import 'package:xo_game/new/theme.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       home: const DashboardScreen(),
//     );
//   }
// }
