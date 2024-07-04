import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textField.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

// register method
  void register(BuildContext context) {
    final _auth = AuthService();

    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    else{
              showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("password doesnt match"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),
            //welcome

            Text(
              "Let's create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),
            //email
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            //pw
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 10),

            //confirm pw
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpwController,
            ),

            const SizedBox(height: 25),

            // login
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),
            // register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
