import 'package:flutter/material.dart';
import '../models/student.dart';
import '../components/student_list_tile.dart';
import '../components/add_student_screen.dart';
import '../components/edit_student_screen.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  List<Student> students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentScreen()),
          ).then((student) {
            if (student != null) {
              setState(() {
                students.add(student);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return StudentListTile(
            student: students[index],
            onView: () {
              _viewStudentDetails(students[index]);
            },
            onEdit: () {
              _editStudentDetails(students[index]);
            },
            onDelete: () {
              _deleteStudent(students[index]);
            },
          );
        },
      ),
    );
  }

  void _viewStudentDetails(Student student) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Student Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${student.name}'),
              Text('Mobile Number: ${student.mobileNumber}'),
              Text('Application Number: ${student.applicationNumber}'),
              Text('Course: ${student.course}'),
              Text('Training Days: ${student.trainingDays}'),
              Text('Total Amount: ${student.totalAmount}'),
              Text('Discount: ${student.discount}'),
              Text('Amount Paid: ${student.amountPaid}'),
              Text('Settle Amount: ${student.settleAmount}'),
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

  void _editStudentDetails(Student student) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditStudentScreen(student: student)),
    ).then((updatedStudent) {
      if (updatedStudent != null) {
        setState(() {
          int index = students.indexWhere((element) => element.id == updatedStudent.id);
          if (index != -1) {
            students[index] = updatedStudent;
          }
        });
      }
    });
  }

  void _deleteStudent(Student student) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this student?'),
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
                  students.removeWhere((element) => element.id == student.id);
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
