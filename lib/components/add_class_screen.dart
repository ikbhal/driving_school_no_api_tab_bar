import 'package:flutter/material.dart';
import '../models/driving_class.dart';

class AddClassScreen extends StatelessWidget {
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController trainerIdController = TextEditingController();
  final TextEditingController trainerNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Class'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: studentIdController,
              decoration: InputDecoration(
                labelText: 'Student ID',
              ),
            ),
            TextField(
              controller: studentNameController,
              decoration: InputDecoration(
                labelText: 'Student Name',
              ),
            ),
            TextField(
              controller: trainerIdController,
              decoration: InputDecoration(
                labelText: 'Trainer ID',
              ),
            ),
            TextField(
              controller: trainerNameController,
              decoration: InputDecoration(
                labelText: 'Trainer Name',
              ),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date',
              ),
            ),
            TextField(
              controller: startTimeController,
              decoration: InputDecoration(
                labelText: 'Start Time',
              ),
            ),
            TextField(
              controller: endTimeController,
              decoration: InputDecoration(
                labelText: 'End Time',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String studentId = studentIdController.text;
                String studentName = studentNameController.text;
                String trainerId = trainerIdController.text;
                String trainerName = trainerNameController.text;
                String date = dateController.text;
                String startTime = startTimeController.text;
                String endTime = endTimeController.text;

                DrivingClass drivingClass = DrivingClass(
                  id: UniqueKey().toString(),
                  studentId: studentId,
                  studentName: studentName,
                  trainerId: trainerId,
                  trainerName: trainerName,
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                );

                Navigator.pop(context, drivingClass);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
