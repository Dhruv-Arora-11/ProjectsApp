import 'package:flutter/material.dart';
import 'package:projects_app/fireabase_part/login_part.dart';
import 'package:projects_app/pages/userregisteration.dart';

import 'homescreen.dart';

class loginscreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  bool login = true;
  final TextEditingController password = TextEditingController();


  loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                        login_logic.login_to_firebase(
                          context,
                            email.text,
                            password.text
                        );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(),
                            ),
                          );
                    },
                    child: const Text("Login"),
                  ),
                  InkWell(child: Text("Are you new ?"),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              registerationScreen(),
                        ),
                    );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
