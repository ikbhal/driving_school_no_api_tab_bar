import 'package:flutter/material.dart';
import '../models/driving_test.dart';

class DrivingTestListTile extends StatelessWidget {
  final DrivingTest drivingTest;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  DrivingTestListTile({
    required this.drivingTest,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(drivingTest.studentName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date: ${drivingTest.date}'),
          Text('Time: ${drivingTest.startTime} - ${drivingTest.endTime}'),
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
