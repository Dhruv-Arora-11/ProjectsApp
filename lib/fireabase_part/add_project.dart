import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class add_project{
  Future add_your_project( List new_list_with_project , String username)async{
    try{
      var collection_reference = await FirebaseFirestore.instance.collection("users");
      print(collection_reference);
      var document = await collection_reference.where('username', isEqualTo: username).get();
      print(document);
      var first_documentSnapshot = document.docs.first;
      print(first_documentSnapshot);
      String doc_id = first_documentSnapshot.id;
      print(doc_id);
      print("yaha tak to ho gya");
      return await collection_reference.doc(doc_id).set({
        "projects" : new_list_with_project
      });

      // return true;
    }catch(e){
      print(e);
      return false;
    }
  }
}

//  Future<bool> add_your_project( List new_list_with_project , String username)async{
// try{
// var collection_reference = await FirebaseFirestore.instance.collection("users");
// var document = await collection_reference.where('username', isEqualTo: username).get();
// var first_documentSnapshot = document.docs.first;
// String doc_id = first_documentSnapshot.id;
// await collection_reference.doc(doc_id).update({
// "projects" : new_list_with_project
// });
// print("yaha tak to ho gya");
// return true;
// }catch(e){
// print(e);
// return false;
// }
// }