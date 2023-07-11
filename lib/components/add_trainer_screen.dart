import 'package:flutter/material.dart';
import '../models/trainer.dart';

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
                Trainer trainer = Trainer(
                  id: UniqueKey().toString(),
                  name: name,
                  mobileNumber: mobileNumber,
                );
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
