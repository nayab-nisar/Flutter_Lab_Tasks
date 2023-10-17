import 'package:flutter/material.dart';
import 'package:flutter_application_5/todo.dart';
import 'package:flutter_application_5/todoprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return TodoProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 08"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: context.watch<TodoProvider>().todoList.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = context.watch<TodoProvider>().todoList[index];
            return ListTile(
              title: Text(todo.title),
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (bool? value) {
                  context.read<TodoProvider>().toggleisDone(index);
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  context.read<TodoProvider>().removeTodo(index);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context
                .read<TodoProvider>()
                .addTodo(Todo(title: "Todo 1", isDone: false));
          },
          child: Icon(Icons.add)),
    );
  }
}
