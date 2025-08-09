import 'package:flutter/material.dart';
import 'package:todo_list/model/task.model.dart';

class TaskDetailPage extends StatefulWidget {
  final Task task;
  const TaskDetailPage({super.key, required this.task});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late bool isImportant;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isImportant = widget.task.important;
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description ?? '';
  }

  saveTask() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final updatedTask = widget.task;
    updatedTask.important = isImportant;
    updatedTask.title = titleController.text;
    updatedTask.description = descriptionController.text.isEmpty
        ? null
        : descriptionController.text;

    Navigator.of(context).pop(updatedTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isImportant = !isImportant;
              });
            },
            icon: Icon(isImportant ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              TextButton(onPressed: saveTask, child: Text('Salvar Tarefa')),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Criada Sex, 24 de mar'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outline),
                    iconSize: 28,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
