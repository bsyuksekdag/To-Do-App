import 'package:todo_app/model/todo_model.dart';

// TodoService sınıfı, todo işlemlerini yönetir.
class TodoService {
  List<Todo> todos = []; // Todo öğelerini saklamak için bir liste

  // Yeni bir todo eklemek için kullanılan fonksiyon
  void addTodo(String title) {
    todos
        .add(Todo(title: title)); // Yeni bir Todo öğesi oluşturup listeye ekler
  }

  // Bir todo'nun tamamlanma durumunu tersine çevirmek için kullanılan fonksiyon
  void toggleTodoCompletion(int index) {
    todos[index].isCompleted = !todos[index]
        .isCompleted; // Seçili Todo'nun tamamlanma durumunu tersine çevirir
  }

  // Bir todo'yu silmek için kullanılan fonksiyon
  void deleteTodo(int index) {
    todos.removeAt(index); // Listeden seçili Todo'yu kaldırır
  }
}
