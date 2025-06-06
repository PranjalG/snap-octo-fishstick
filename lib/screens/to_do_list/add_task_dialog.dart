import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  final Function(String) addTaskCallback;
  final TextEditingController taskController = TextEditingController();

  AddTaskDialog({required this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New To-Do Item'),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                hintText: 'Enter your task',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent,
          foregroundColor: Colors.black),
          onPressed: () {
            if (taskController.text.isNotEmpty) {
              addTaskCallback(taskController.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
