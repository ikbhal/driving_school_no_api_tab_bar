import 'package:flutter/material.dart';
import '../models/driving_class.dart';

class EditClassScreen extends StatefulWidget {
  final DrivingClass drivingClass;

  EditClassScreen({required this.drivingClass});

  @override
  _EditClassScreenState createState() => _EditClassScreenState();
}

class _EditClassScreenState extends State<EditClassScreen> {
  late TextEditingController studentIdController;
  late TextEditingController studentNameController;
  late TextEditingController trainerIdController;
  late TextEditingController trainerNameController;
  late TextEditingController dateController;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;

  @override
  void initState() {
    super.initState();
    studentIdController = TextEditingController(text: widget.drivingClass.studentId);
    studentNameController = TextEditingController(text: widget.drivingClass.studentName);
    trainerIdController = TextEditingController(text: widget.drivingClass.trainerId);
    trainerNameController = TextEditingController(text: widget.drivingClass.trainerName);
    dateController = TextEditingController(text: widget.drivingClass.date);
    startTimeController = TextEditingController(text: widget.drivingClass.startTime);
    endTimeController = TextEditingController(text: widget.drivingClass.endTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Class'),
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

                DrivingClass updatedDrivingClass = DrivingClass(
                  id: widget.drivingClass.id,
                  studentId: studentId,
                  studentName: studentName,
                  trainerId: trainerId,
                  trainerName: trainerName,
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                );

                Navigator.pop(context, updatedDrivingClass);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
