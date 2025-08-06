import 'package:flutter/material.dart';
import 'package:todo_list/model/task.model.dart';

class TasksListPage extends StatelessWidget {
  TasksListPage({super.key});
  final List<Task> tasks = [
    Task(title: 'Marcar uma reunião', description: 'Com o cliente'),
    Task(
      title: 'Comprar pão',
      description: 'Na padaria perto de casa',
      important: true,
    )..completed = true,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tarefas'), centerTitle: true),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
                leading: Checkbox(value: task.completed, onChanged: (value) {}),
                trailing: IconButton(
                  icon: Icon(
                    task.important ? Icons.star : Icons.star_border,
                    color: Colors.indigo,
                  ),
                  onPressed: () {},
                ),
                onTap: () {},
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
