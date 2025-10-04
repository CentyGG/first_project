import 'package:flutter/material.dart';
import 'notes_list_screen.dart';
import 'add_note_screen.dart';
import 'settings_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои заметки'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Добро пожаловать!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            _buildMenuButton(context, 'Мои заметки', Icons.list, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotesListScreen()));
            }),
            _buildMenuButton(context, 'Добавить заметку', Icons.add, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNoteScreen()));
            }),
            _buildMenuButton(context, 'Настройки', Icons.settings, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            }),
            _buildMenuButton(context, 'О приложении', Icons.info, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
            }),],),),);
  }
  Widget _buildMenuButton(BuildContext context, String text, IconData icon, VoidCallback onPressed) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
      ),
    );
  }
}