import 'package:flutter/material.dart';
import '../models/driving_test.dart';

class AddTestScreen extends StatelessWidget {
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Test'),
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
                String date = dateController.text;
                String startTime = startTimeController.text;
                String endTime = endTimeController.text;

                DrivingTest drivingTest = DrivingTest(
                  id: UniqueKey().toString(),
                  studentId: studentId,
                  studentName: studentName,
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                );

                Navigator.pop(context, drivingTest);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
