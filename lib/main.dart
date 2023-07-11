import 'package:flutter/material.dart';

void main() {
  runApp(DrivingManagementApp());
}

class DrivingManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driving Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driving Management'),
      ),
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Student'),
                Tab(text: 'Trainer'),
                Tab(text: 'Driving Class'),
                Tab(text: 'Driving Test'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              StudentScreen(),
              TrainerScreen(),
              DrivingClassScreen(),
              DrivingTestScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

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
          return ListTile(
            title: Text(students[index].name),
            subtitle: Text(students[index].mobileNumber),
          );
        },
      ),
    );
  }
}

class AddStudentScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: mobileNumberController,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String mobileNumber = mobileNumberController.text;
                Student student = Student(name: name, mobileNumber: mobileNumber);
                Navigator.pop(context, student);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class TrainerScreen extends StatefulWidget {
  @override
  _TrainerScreenState createState() => _TrainerScreenState();
}

class _TrainerScreenState extends State<TrainerScreen> {
  List<Trainer> trainers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTrainerScreen()),
          ).then((trainer) {
            if (trainer != null) {
              setState(() {
                trainers.add(trainer);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(trainers[index].name),
            subtitle: Text(trainers[index].mobileNumber),
          );
        },
      ),
    );
  }
}

class AddTrainerScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Trainer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: mobileNumberController,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String mobileNumber = mobileNumberController.text;
                Trainer trainer = Trainer(name: name, mobileNumber: mobileNumber);
                Navigator.pop(context, trainer);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class DrivingClassScreen extends StatefulWidget {
  @override
  _DrivingClassScreenState createState() => _DrivingClassScreenState();
}

class _DrivingClassScreenState extends State<DrivingClassScreen> {

  List<DrivingClass> drivingClasses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDrivingClassScreen()),
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
          return ListTile(
            title: Text(drivingClasses[index].studentName),
            subtitle: Text(drivingClasses[index].trainerName),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Date: ${drivingClasses[index].date}'),
                Text('Time: ${drivingClasses[index].startTime} - ${drivingClasses[index].endTime}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AddDrivingClassScreen extends StatelessWidget {
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
        title: Text('Add Driving Class'),
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

class DrivingTestScreen extends StatefulWidget {
  @override
  _DrivingTestScreenState createState() => _DrivingTestScreenState();
}

class _DrivingTestScreenState extends State<DrivingTestScreen> {
  List<DrivingTest> drivingTests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDrivingTestScreen()),
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
          return ListTile(
            title: Text(drivingTests[index].studentName),
            subtitle: Text('Date: ${drivingTests[index].date}'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Time: ${drivingTests[index].startTime} - ${drivingTests[index].endTime}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AddDrivingTestScreen extends StatelessWidget {
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Driving Test'),
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

class Student {
  final String name;
  final String mobileNumber;

  Student({required this.name, required this.mobileNumber});
}

class Trainer {
  final String name;
  final String mobileNumber;

  Trainer({required this.name, required this.mobileNumber});
}

class DrivingClass {
  final String studentId;
  final String studentName;
  final String trainerId;
  final String trainerName;
  final String date;
  final String startTime;
  final String endTime;

  DrivingClass({
    required this.studentId,
    required this.studentName,
    required this.trainerId,
    required this.trainerName,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
}

class DrivingTest {
  final String studentId;
  final String studentName;
  final String date;
  final String startTime;
  final String endTime;

  DrivingTest({
    required this.studentId,
    required this.studentName,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
}
