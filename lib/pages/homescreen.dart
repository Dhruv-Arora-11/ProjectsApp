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
   List<String> projects = [];

  String? username = FirebaseAuth.instance.currentUser?.email.toString();

  @override
  void initState() {
    fetch_all_data(username: username!);
    super.initState();
  }

  final TextEditingController projectController = TextEditingController();

  void addItem() async {
    await add_project().add_your_project( projects, username!);
    print("success");
  }


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
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projects[index]),
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
                controller: projectController,
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
                Navigator.of(context).pop();
              },

            ),
            TextButton(
              onPressed: () {
                if (projectController.text.isNotEmpty) {
                   projects.add(projectController.text);
                   print(projects);
                   addItem();

                   print("rujnning");
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

  void _deleteProject(int index) {
    projects.removeAt(index);
    add_project().add_your_project(projects, username!);
    setState(() {});
  }
}
