import 'package:flutter/material.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = [
      'Купить молоко',
      'Сделать домашнюю работу',
      'Встреча в 15:00',
      'Прочитать книгу',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои заметки'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              title: Text(notes[index]),
              subtitle: Text('Заметка ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}