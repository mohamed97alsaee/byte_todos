import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selectedStatus = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  List tasks = [];

  @override
  void initState() {
    if (kDebugMode) {
      print('HELLO FROM HOME INIT');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Text(
                    'Done',
                    style: TextStyle(
                        color: selectedStatus == true
                            ? Colors.green
                            : Colors.black87),
                  ),
                  onTap: () {
                    setState(() {
                      selectedStatus = true;
                    });
                  },
                ),
                GestureDetector(
                  child: Text(
                    'Waiting',
                    style: TextStyle(
                        color: selectedStatus == false
                            ? Colors.green
                            : Colors.black87),
                  ),
                  onTap: () {
                    setState(() {
                      selectedStatus = false;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return selectedStatus == tasks[index]['isDone']
                    ? ListTile(
                        title: Text(
                          tasks[index]['title'],
                          style: TextStyle(
                              decoration: tasks[index]['isDone']
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tasks[index]['subtitle'].toString(),
                              style: TextStyle(
                                  decoration: tasks[index]['isDone']
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            Text(
                              tasks[index]['created_at']
                                  .toString()
                                  .substring(0, 10)
                                  .replaceAll('-', '/'),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  decoration: tasks[index]['isDone']
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                          ],
                        ),
                        trailing: Checkbox(
                          value: tasks[index]['isDone'],
                          onChanged: (value) {
                            setState(() {
                              tasks[index]['isDone'] = !tasks[index]['isDone'];
                            });
                          },
                        ),
                      )
                    : Container();
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Hello From Dialog'),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: titleController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              if (value.length <= 3) {
                                return 'Please enter valid task';
                              }
                            },
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: subTitleController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              if (value.length <= 3) {
                                return 'Please enter valid task';
                              }
                            },
                          ),
                          TextButton(
                              onPressed: () {
                                if (titleController.text.isNotEmpty &&
                                    subTitleController.text.isNotEmpty) {
                                  setState(() {
                                    tasks.add(
                                      {
                                        'title': titleController.text,
                                        'subtitle': subTitleController.text,
                                        'isDone': false,
                                        "created_at": DateTime.now()
                                      },
                                    );
                                  });
                                  titleController.clear();
                                  subTitleController.clear();

                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Add')),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
