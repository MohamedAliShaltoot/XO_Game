import 'package:flutter/material.dart';
import 'package:xo_game/players_model.dart';
import 'package:xo_game/xo_game_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName="login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String player1='';
    TextEditingController player2=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 56, 97),
        title: const Text(
          "Login",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 30, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value){
                  player1 = value;
                },
                decoration: InputDecoration(
                  hintText:"Player One",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 4, 33, 56),width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue,width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 6, 42, 64),width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
        
                ),
              ),
              const SizedBox(height: 20,),
               TextField(
                controller:player2 ,
                decoration: InputDecoration(
                  hintText:"Player Two",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 4, 33, 56),width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 19, 139, 214),width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 6, 42, 64),width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
        
                ),
              ),
        
              const SizedBox(height: 20,),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 11, 36, 56),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
                onPressed: (){
                 Navigator.pushNamed(context,
                 XoGameScreen.routeName,
                 arguments: PlayersModel(player1: player1, player2: player2.text));
                }, 
                child: const Text(
                  "Play",
                style:TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ))
            ],
          ),
        ),
      ),
    );
  }
}