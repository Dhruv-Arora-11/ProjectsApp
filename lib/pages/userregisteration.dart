import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projects_app/fireabase_part/registeration_part.dart';
import 'package:projects_app/pages/homescreen.dart';

class registerationScreen extends StatelessWidget {
  final TextEditingController email_for_reg = TextEditingController();
  final TextEditingController password_for_reg = TextEditingController();

  registerationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Register"),
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
                    controller: email_for_reg,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: password_for_reg,
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
                    onPressed: () async{
                      try {
                        registeration.
                        register_user(
                            email_for_reg.text,
                            password_for_reg.text
                        );
                        await FirebaseFirestore.instance.collection("users").add({
                          "email" : email_for_reg.text,
                          "password" : password_for_reg.text,
                          "projects" : []
                        });
                        print("data register ke baad");

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(),
                            ),
                        );

                      }catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Teri galati nhi h bhai , firebase hi chutia h'),
                            duration: Duration(seconds: 1), // Customize duration
                          ),
                        );
                      }
                    },
                    child: const Text("register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}