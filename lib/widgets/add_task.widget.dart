import 'package:flutter/material.dart';
import 'package:todo_list/model/task.model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var isImportant = false;
  var showDescription = false;
  final formKey = GlobalKey<FormState>();

  addTask() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final task = Task(
      title: titleController.text,
      description: descriptionController.text.isEmpty
          ? null
          : descriptionController.text,
      important: isImportant,
    );

    Navigator.of(context).pop(task);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Adicionar Tarefa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.black54,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Divider(thickness: 1, height: 0),
            SizedBox(height: 15),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'O que você quer fazer hoje?',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O campo é obrigatório.';
                }

                return null;
              },
            ),
            if (showDescription)
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Adicionar informações.',
                ),
              ),
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.sort),
                  onTap: () {
                    setState(() {
                      showDescription = true;
                    });
                  },
                ),
                SizedBox(width: 20),
                GestureDetector(
                  child: Icon(isImportant ? Icons.star : Icons.star_border),
                  onTap: () {
                    setState(() {
                      isImportant = !isImportant;
                    });
                  },
                ),
                Spacer(),
                TextButton(onPressed: addTask, child: Text('Adicionar')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
