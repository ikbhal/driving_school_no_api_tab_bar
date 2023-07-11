import 'package:flutter/material.dart';
import '../components/edit_test_screen.dart';
import '../models/driving_test.dart';
import '../components/driving_test_list_tile.dart';
import '../components/add_test_screen.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<DrivingTest> drivingTests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTestScreen()),
          ).then((drivingTest) {
            if (drivingTest != null) {
              setState(() {
                drivingTests.add(drivingTest);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: drivingTests.length,
        itemBuilder: (context, index) {
          return DrivingTestListTile(
            drivingTest: drivingTests[index],
            onView: () {
              _viewDrivingTestDetails(drivingTests[index]);
            },
            onEdit: () {
              _editDrivingTestDetails(drivingTests[index]);
            },
            onDelete: () {
              _deleteDrivingTest(drivingTests[index]);
            },
          );
        },
      ),
    );
  }

  void _viewDrivingTestDetails(DrivingTest drivingTest) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Driving Test Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Student ID: ${drivingTest.studentId}'),
              Text('Student Name: ${drivingTest.studentName}'),
              Text('Date: ${drivingTest.date}'),
              Text('Start Time: ${drivingTest.startTime}'),
              Text('End Time: ${drivingTest.endTime}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _editDrivingTestDetails(DrivingTest drivingTest) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditTestScreen(drivingTest: drivingTest)),
    ).then((updatedDrivingTest) {
      if (updatedDrivingTest != null) {
        setState(() {
          int index = drivingTests.indexWhere((element) => element.id == updatedDrivingTest.id);
          if (index != -1) {
            drivingTests[index] = updatedDrivingTest;
          }
        });
      }
    });
  }

  void _deleteDrivingTest(DrivingTest drivingTest) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this driving test?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  drivingTests.removeWhere((element) => element.id == drivingTest.id);
                });
                Navigator.pop(context);
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
