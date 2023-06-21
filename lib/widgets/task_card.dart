import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
            setState(() {
              widget.taskModel.isDone = !widget.taskModel.isDone;
            });
          },
        ));
  }
}
