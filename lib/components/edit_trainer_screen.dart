import 'package:flutter/material.dart';
import '../models/trainer.dart';

class EditTrainerScreen extends StatefulWidget {
  final Trainer trainer;

  EditTrainerScreen({required this.trainer});

  @override
  _EditTrainerScreenState createState() => _EditTrainerScreenState();
}

class _EditTrainerScreenState extends State<EditTrainerScreen> {
  late TextEditingController nameController;
  late TextEditingController mobileNumberController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.trainer.name);
    mobileNumberController =
        TextEditingController(text: widget.trainer.mobileNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Trainer'),
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
                Trainer updatedTrainer = Trainer(
                  id: widget.trainer.id,
                  name: name,
                  mobileNumber: mobileNumber,
                );
                Navigator.pop(context, updatedTrainer);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
