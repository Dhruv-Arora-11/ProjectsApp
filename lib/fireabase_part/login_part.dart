import 'package:firebase_auth/firebase_auth.dart';

class login_logic{
  final String email;
  final String password;

  login_logic({required this.email , required this.password});

  static Future<bool> login_to_firebase(String email , String password)async{
    try{
      await FirebaseAuth.
      instance.
      signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return true;
    }catch(e){
      return false;
    }
  }
}