import 'package:firebase_auth/firebase_auth.dart';

class registeration{
  final String email;
  final String password;

  registeration({required this.email , required this.password});

  static Future<bool> register_user(String email , String password)async{
    try {
      await FirebaseAuth.
      instance.
      createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return true;
    }catch(e){
      return false;
    }
  }
}