import 'dart:ffi';

import 'package:flutter/material.dart';

import '../services/todo_services.dart';

class TodoListView extends StatefulWidget {
  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final TodoService todoService = TodoService();
  // Todo işlemlerini yöneten servis
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Listesi'),
      ),
      body: ListView.builder(
        itemCount: todoService.todos.length,
        itemBuilder: (context, index) {
          final todo = todoService.todos[index];
          return ListTile(
            title: Text(todo.title), // Todo başlığını gösterir
            trailing: Checkbox(
              value: todo.isCompleted, // Tamamlanma durumunu gösterir
              onChanged: (_) {
                _toggleTodoCompletion(index); // Tamamlanma durumunu değiştirir
              },
            ),
            onLongPress: () {
              _deleteTodo(index); // Uzun basıldığında todo'yu siler
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodoDialog(context); // Yeni todo eklemek için dialog gösterir
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Yeni todo eklemek için dialog gösteren fonksiyon
  void _addTodoDialog(BuildContext context) {
    String newTodoTitle = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Yeni Todo Ekle'),
          content: TextField(
            onChanged: (value) {
              newTodoTitle = value; // Text alanındaki değerleri takip eder
            },
            decoration: InputDecoration(hintText: 'Todo Başlığı'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialogu kapatır
              },
              child: Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                if (newTodoTitle.isNotEmpty) {
                  _addTodo(newTodoTitle); // Yeni todo ekler
                  Navigator.of(context).pop(); // Dialogu kapatır
                }
              },
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  void _addTodo(String title) {
    setState(() {
      todoService.addTodo(title);
    });
  }

  void _toggleTodoCompletion(int index) {
    setState(() {
      todoService.toggleTodoCompletion(index);
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      todoService.deleteTodo(index);
    });
  }
}
