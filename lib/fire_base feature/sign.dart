import 'package:flutter/material.dart';
import 'package:xo_game/fire_base%20feature/auth_service.dart';
//import 'package:xo_game/fire_base%20feature/test_screen.dart';
import 'package:xo_game/xo_features/xo_screens/loginscreen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void signUp() async {
    var user = await _authService.signUp(
        emailController.text, passwordController.text);
    if (user != null) {
      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Signup Failed!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
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
            ElevatedButton(onPressed: signUp, child: const Text("Sign Up")),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Already have an account? Login")),
          ],
        ),
      ),
    );
  }
}
