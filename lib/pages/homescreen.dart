import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projects_app/fireabase_part/add_project.dart';
import 'package:projects_app/fireabase_part/fetch_all_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Example project list
  final List<String> projects = [];

  String? username = FirebaseAuth.instance.currentUser?.email.toString();


  @override
  void initState() {
    fetch_all_data(username: username!);
    super.initState();
  }

  final TextEditingController projectController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Projects'),
      ),

      // add button

      floatingActionButton: FloatingActionButton(
        onPressed: () => AlertBox(context),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: projects.length, // Number of items in the list
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projects[index]), // Display project name
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _deleteProject(index);
              },
            ),
          );
        },
      ),
    );
  }

  // Function to display the Add Project Dialog
  void AlertBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Project"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: projectController, // Attach controller to the TextField
                decoration: InputDecoration(
                  labelText: "Project Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },

            ),
            TextButton(
              onPressed: () {
                if (projectController.text.isNotEmpty) {
                   projects.add(projectController.text);
                   add_project.add_your_project(context, projects, username!);
                   setState(() {});
                  projectController.clear();
                  Navigator.of(context).pop();

                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Function to delete a project
  void _deleteProject(int index) {
    projects.removeAt(index);
    add_project.add_your_project(context, projects, username!);
    setState(() {});
  }
}
