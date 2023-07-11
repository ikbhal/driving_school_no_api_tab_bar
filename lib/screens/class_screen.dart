import 'package:flutter/material.dart';
import '../components/edit_class_screen.dart';
import '../models/driving_class.dart';
import '../components/class_list_tile.dart';
import '../components/add_class_screen.dart';


class ClassScreen extends StatefulWidget {
  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  List<DrivingClass> drivingClasses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddClassScreen()),
          ).then((drivingClass) {
            if (drivingClass != null) {
              setState(() {
                drivingClasses.add(drivingClass);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: drivingClasses.length,
        itemBuilder: (context, index) {
          return DrivingClassListTile(
            drivingClass: drivingClasses[index],
            onView: () {
              _viewDrivingClassDetails(drivingClasses[index]);
            },
            onEdit: () {
              _editDrivingClassDetails(drivingClasses[index]);
            },
            onDelete: () {
              _deleteDrivingClass(drivingClasses[index]);
            },
          );
        },
      ),
    );
  }

  void _viewDrivingClassDetails(DrivingClass drivingClass) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Driving Class Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Student ID: ${drivingClass.studentId}'),
              Text('Student Name: ${drivingClass.studentName}'),
              Text('Trainer ID: ${drivingClass.trainerId}'),
              Text('Trainer Name: ${drivingClass.trainerName}'),
              Text('Date: ${drivingClass.date}'),
              Text('Start Time: ${drivingClass.startTime}'),
              Text('End Time: ${drivingClass.endTime}'),
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

  void _editDrivingClassDetails(DrivingClass drivingClass) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditClassScreen(drivingClass: drivingClass)),
    ).then((updatedDrivingClass) {
      if (updatedDrivingClass != null) {
        setState(() {
          int index = drivingClasses.indexWhere((element) => element.id == updatedDrivingClass.id);
          if (index != -1) {
            drivingClasses[index] = updatedDrivingClass;
          }
        });
      }
    });
  }

  void _deleteDrivingClass(DrivingClass drivingClass) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this driving class?'),
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
                  drivingClasses.removeWhere((element) => element.id == drivingClass.id);
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
