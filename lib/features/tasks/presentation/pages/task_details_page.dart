import 'package:flutter/material.dart';

class TaskDetailsPage extends StatelessWidget {
  final String taskId;

  const TaskDetailsPage({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('task detail'));
  }
}
