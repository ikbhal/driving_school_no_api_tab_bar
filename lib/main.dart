import 'package:flutter/material.dart';
import './screens/student_screen.dart';
import './screens/trainer_screen.dart';
import './screens/class_screen.dart';
import './screens/test_screen.dart';

void main() {
  runApp(DrivingManagementApp());
}

class DrivingManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driving Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
        ),
      ),
      home: MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _screens = [
    StudentScreen(),
    TrainerScreen(),
    ClassScreen(),
    TestScreen(),
  ];

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driving Management System'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabChanged,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Trainers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Tests',
          ),
        ],
      ),
    );
  }
}