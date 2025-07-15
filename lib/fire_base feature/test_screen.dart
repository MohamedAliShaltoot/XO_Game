import 'package:flutter/material.dart';
import 'package:xo_game/xo_features/xo_screens/xo_game_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InkWell(
        onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context) => const XoGameScreen()));
        },
        
        
        child: const Text("Test Screen"))),
    );
  }
}
