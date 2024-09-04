import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login_logic{
  final String email;
  final String password;

  login_logic({required this.email , required this.password});

  static Future<bool> login_to_firebase( context , String email , String password)async{
    try{
      await FirebaseAuth.
      instance.
      signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return true;
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bhai bakchodi kyu kr rha h'), // Text to display
          duration: Duration(seconds: 2), // Duration the snackbar will be visible
        ),
      );

      return false;
    }
  }
}