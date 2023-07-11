import 'package:flutter/material.dart';
import '../models/driving_class.dart';

class DrivingClassListTile extends StatelessWidget {
  final DrivingClass drivingClass;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  DrivingClassListTile({
    required this.drivingClass,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(drivingClass.studentName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trainer: ${drivingClass.trainerName}'),
          Text('Date: ${drivingClass.date}'),
          Text('Time: ${drivingClass.startTime} - ${drivingClass.endTime}'),
        ],
      ),
      trailing: PopupMenuButton<String>(
        itemBuilder: (context) {
          return [
            PopupMenuItem<String>(
              value: 'view',
              child: Text('View'),
            ),
            PopupMenuItem<String>(
              value: 'edit',
              child: Text('Edit'),
            ),
            PopupMenuItem<String>(
              value: 'delete',
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 'view') {
            onView();
          } else if (value == 'edit') {
            onEdit();
          } else if (value == 'delete') {
            onDelete();
          }
        },
      ),
    );
  }
}
