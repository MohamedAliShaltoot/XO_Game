// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:xo_game/fire_base%20feature/auth_service.dart';
import 'package:xo_game/fire_base%20feature/test_screen.dart';
import 'package:xo_game/loginscreen.dart';

class LoginScreenn extends StatefulWidget {
  static const String routeName = "login";
  const LoginScreenn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void login() async {
    var user = await _authService.signIn(
        emailController.text, passwordController.text);
    if (user != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Failed!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email")),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text("Login")),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 16),
                    backgroundColor: Colors.black),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TestScreen())),
                child: const Text(
                  "Don't have an account? Sign up",
                  // style: TextStyle(color: Color.fromARGB(0, 8, 136, 215)),
                )),
          ],
        ),
      ),
    );
  }
}
