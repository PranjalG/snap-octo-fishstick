import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/bloc/to_do_list_bloc/to_do_list_bloc.dart';
import 'package:layout/screens/to_do_list/add_task_dialog.dart';

class ToDoListPageScreen extends StatefulWidget {
  const ToDoListPageScreen({super.key});

  @override
  State<ToDoListPageScreen> createState() => _ToDoListPageScreenState();
}

class _ToDoListPageScreenState extends State<ToDoListPageScreen> {
  final List<String> taskList = ['Task One', 'Task Two'];
  final TextEditingController taskController = TextEditingController();

  void _addTask(String task) {
    setState(() {
      taskList.add(task);
    });
  }

  void _openNewBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(
          addTaskCallback: _addTask, // Passing the callback
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => ToDoListBloc(),
          child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${index + 1}) ${taskList[index]}'),
                      Icon(Icons.cancel, color: Colors.brown)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: _openNewBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}