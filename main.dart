// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'package:flutter/material.dart';


class User {
  List<TodoItemData> todoItems = [];
}

class TodoItemData {
  String name;
  bool done;
  Object? details = {'created datetime': 0, 'done datetime': 0};

  String describe() {
    return '$name, $done, $details';
  }

  TodoItemData({this.name = "unnamed", this.done = false, this.details});
}

var user = User();

void addTodo(TodoItemData item) {
  user.todoItems.add(item);
}

class TodoView extends StatefulWidget {
  TodoView ({
    super.key,
    this.color = const Color(0xFFFFE306),
    this.child,
  });

  final Color color;
  final Widget? child;

  @override
  State<Bird> createState() => _BirdState();
}


class App extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Todo List")
        )
      )
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  for (int i = 0; i < 10; i++) {
    print('hello ${i + 1}');
  }
  var t = TodoItemData(
    name: "afdasf",
    done: true,
  );

  print(t.describe());

  for (int i = 0; i < 10; i++) {
    var t = TodoItemData(
      name: "item $i",
      done: false,
    );
    addTodo(t);
  }

  print(user.todoItems.map((t) => t.describe()));
  
  runApp(App());
  
}
