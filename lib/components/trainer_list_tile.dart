import 'package:flutter/material.dart';
import '../models/trainer.dart';

class TrainerListTile extends StatelessWidget {
  final Trainer trainer;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  TrainerListTile({
    required this.trainer,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trainer.name),
      subtitle: Text(trainer.mobileNumber),
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
