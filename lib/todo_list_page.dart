import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
        ),
      ),
      body: MyTodoListPage(),
    );
  }
}

class MyTodoListPage extends StatefulWidget {
  const MyTodoListPage({super.key});

  @override
  State<MyTodoListPage> createState() => _MyTodoListPageState();
}

class _MyTodoListPageState extends State<MyTodoListPage> {
  List<String> todoList = [];
  TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  todoList[index],
                ),
              ),
            ),
          ),
          TextFormField(
            controller: controller1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      todoList.add(controller1.text);
                      controller1.clear();
                    });
                  },
                  child: Text('Add')),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    todoList.remove(controller1.text);
                    controller1.clear();
                  });
                },
                child: Text(
                  'Delete',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
