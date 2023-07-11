import 'package:flutter/material.dart';
import '../models/trainer.dart';
import '../components/trainer_list_tile.dart';
import '../components/add_trainer_screen.dart';
import '../components/edit_trainer_screen.dart';

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
          return TrainerListTile(
            trainer: trainers[index],
            onView: () {
              _viewTrainerDetails(trainers[index]);
            },
            onEdit: () {
              _editTrainerDetails(trainers[index]);
            },
            onDelete: () {
              _deleteTrainer(trainers[index]);
            },
          );
        },
      ),
    );
  }

  void _viewTrainerDetails(Trainer trainer) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Trainer Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${trainer.name}'),
              Text('Mobile Number: ${trainer.mobileNumber}'),
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

  void _editTrainerDetails(Trainer trainer) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditTrainerScreen(trainer: trainer)),
    ).then((updatedTrainer) {
      if (updatedTrainer != null) {
        setState(() {
          int index = trainers.indexWhere((element) => element.id == updatedTrainer.id);
          if (index != -1) {
            trainers[index] = updatedTrainer;
          }
        });
      }
    });
  }

  void _deleteTrainer(Trainer trainer) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this trainer?'),
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
                  trainers.removeWhere((element) => element.id == trainer.id);
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
