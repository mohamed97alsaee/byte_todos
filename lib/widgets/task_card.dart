import 'package:byte_todos/screens/task_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskModel, required this.function});

  final TaskModel taskModel;
  final Function function;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => TaskDetailsScreen(
                      taskModel: widget.taskModel,
                    )));
      },
      child: ListTile(
          title: Text(
            widget.taskModel.title,
            style: TextStyle(
                decoration: widget.taskModel.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.taskModel.subtile.toString(),
                style: TextStyle(
                    decoration: widget.taskModel.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Text(
                widget.taskModel.createdAt
                    .toString()
                    .substring(0, 10)
                    .replaceAll('-', '/'),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    decoration: widget.taskModel.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          trailing: Checkbox(
            value: widget.taskModel.isDone,
            onChanged: (value) {
              widget.function();
            },
          )),
    );
  }
}
