import 'package:cloud_firestore/cloud_firestore.dart';

class fetch_all_data{
  final String username;

  fetch_all_data({required this.username});

  dynamic fetch_data(String username)async{
    var user_collection = await FirebaseFirestore.instance.collection("users");
    var my_doc = await user_collection.where("username", isEqualTo:username).get();
    var current_user_doc = my_doc.docs.first;
    List project_list = current_user_doc["projects"];
    return project_list;
  }
}