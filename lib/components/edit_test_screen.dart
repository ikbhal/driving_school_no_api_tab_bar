import 'package:flutter/material.dart';
import '../models/driving_test.dart';

class EditTestScreen extends StatefulWidget {
  final DrivingTest drivingTest;

  EditTestScreen({required this.drivingTest});

  @override
  _EditTestScreenState createState() => _EditTestScreenState();
}

class _EditTestScreenState extends State<EditTestScreen> {
  late TextEditingController studentIdController;
  late TextEditingController studentNameController;
  late TextEditingController dateController;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;

  @override
  void initState() {
    super.initState();
    studentIdController = TextEditingController(text: widget.drivingTest.studentId);
    studentNameController = TextEditingController(text: widget.drivingTest.studentName);
    dateController = TextEditingController(text: widget.drivingTest.date);
    startTimeController = TextEditingController(text: widget.drivingTest.startTime);
    endTimeController = TextEditingController(text: widget.drivingTest.endTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Test'),
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

                DrivingTest updatedDrivingTest = DrivingTest(
                  id: widget.drivingTest.id,
                  studentId: studentId,
                  studentName: studentName,
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                );

                Navigator.pop(context, updatedDrivingTest);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
