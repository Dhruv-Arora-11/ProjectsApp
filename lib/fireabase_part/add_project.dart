import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class add_project{
  static Future<bool> add_your_project(BuildContext context , List new_list_with_project , String username)async{
    try{
      var collection_reference = await FirebaseFirestore.instance.collection("users");
      var document = await collection_reference.where('username', isEqualTo: username).get();
      var first_documentSnapshot = document.docs.first;
      String doc_id = first_documentSnapshot.id;
      await collection_reference.doc(doc_id).update({
        "projects" : new_list_with_project
      });
      return true;
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Kuch bakchodi ho gyi bhai !!!'),
          duration: Duration(seconds: 3), // Customize duration
        ),
      );
      return false;
    }
  }
}