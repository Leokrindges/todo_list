import 'package:flutter/material.dart';
import 'package:todo_list/model/task.model.dart';
import 'package:todo_list/pages/task_detail.page.dart';
import 'package:todo_list/widgets/add_task.widget.dart';

class TasksListPage extends StatefulWidget {
  const TasksListPage({super.key});

  @override
  State<TasksListPage> createState() => _TasksListPageState();
}

class _TasksListPageState extends State<TasksListPage> {
  final List<Task> tasks = [];

  void addTask() async {
    final newTask = await showModalBottomSheet<Task>(
      context: context,
      builder: (ctx) => const AddTask(),
    );
    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  void updatedTask(task, int index) async {
    final taskUpdated = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => TaskDetailPage(task: task)));

    if (taskUpdated != null) {
      setState(() {
        tasks[index] = taskUpdated;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tarefas'), centerTitle: true),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addTask,
        label: Text('Nova Tarefa'),
        icon: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (ctx, index) {
            final task = tasks[index];
            return Card(
              elevation: 3,
              color: Colors.indigo[100],
              child: ListTile(
                title: Text(task.title),
                subtitle: Text(task.description ?? ''),
                leading: Checkbox(
                  value: task.completed,
                  onChanged: (value) {
                    setState(() {
                      task.changeStatus(value!);
                    });
                  },
                ),
                trailing: IconButton(
                  color: Colors.indigo,
                  icon: Icon(task.important ? Icons.star : Icons.star_border),
                  onPressed: () {
                    setState(() {
                      task.changeImportance();
                    });
                  },
                ),
                onTap: () => updatedTask(task, index),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
