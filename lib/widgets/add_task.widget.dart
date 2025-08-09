import 'package:flutter/material.dart';

class AddTast extends StatelessWidget {
  const AddTast({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
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
                onPressed: () {},
              ),
            ],
          ),
          Divider(thickness: 1, height: 0),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'O que você quer fazer hoje?',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Adicionar informações.',
            ),
          ),
          Row(
            children: [
              Icon(Icons.sort),
              SizedBox(width: 20),
              Icon(Icons.star_border),
              Spacer(),
              TextButton(onPressed: () {}, child: Text('Adicionar')),
            ],
          ),
        ],
      ),
    );
  }
}
