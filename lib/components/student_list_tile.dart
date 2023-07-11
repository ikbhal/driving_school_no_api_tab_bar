import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentListTile extends StatelessWidget {
  final Student student;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  StudentListTile({
    required this.student,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(student.name),
      subtitle: Text(student.mobileNumber),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: onView,
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
