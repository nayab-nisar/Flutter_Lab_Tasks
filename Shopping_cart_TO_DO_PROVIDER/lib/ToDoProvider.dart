import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_5/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> todos = [];

  //arrow code of geter method in one line
  List<Todo> get todoList => todos;

  addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  toggleisDone(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    notifyListeners();
  }

//geter method used to get the value using the full implementation

  // List<Todo> getTodos(){
  //   List<Todo> todolist = todos;
  //   return todolist;
  // }
}
