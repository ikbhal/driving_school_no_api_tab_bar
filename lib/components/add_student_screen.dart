import 'package:flutter/material.dart';
import '../models/student.dart';

class AddStudentScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController applicationNumberController =
      TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController trainingDaysController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController amountPaidController = TextEditingController();
  final TextEditingController settleAmountController = TextEditingController();

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
            TextField(
              controller: applicationNumberController,
              decoration: InputDecoration(
                labelText: 'Application Number',
              ),
            ),
            TextField(
              controller: courseController,
              decoration: InputDecoration(
                labelText: 'Course',
              ),
            ),
            TextField(
              controller: trainingDaysController,
              decoration: InputDecoration(
                labelText: 'Training Days',
              ),
            ),
            TextField(
              controller: totalAmountController,
              decoration: InputDecoration(
                labelText: 'Total Amount',
              ),
            ),
            TextField(
              controller: discountController,
              decoration: InputDecoration(
                labelText: 'Discount',
              ),
            ),
            TextField(
              controller: amountPaidController,
              decoration: InputDecoration(
                labelText: 'Amount Paid',
              ),
            ),
            TextField(
              controller: settleAmountController,
              decoration: InputDecoration(
                labelText: 'Settle Amount',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String mobileNumber = mobileNumberController.text;
                String applicationNumber = applicationNumberController.text;
                String course = courseController.text;
                int trainingDays = int.tryParse(trainingDaysController.text) ?? 0;
                double totalAmount =
                    double.tryParse(totalAmountController.text) ?? 0.0;
                double discount = double.tryParse(discountController.text) ?? 0.0;
                double amountPaid =
                    double.tryParse(amountPaidController.text) ?? 0.0;
                double settleAmount =
                    double.tryParse(settleAmountController.text) ?? 0.0;

                Student student = Student(
                  id: UniqueKey().toString(),
                  name: name,
                  mobileNumber: mobileNumber,
                  applicationNumber: applicationNumber,
                  course: course,
                  trainingDays: trainingDays,
                  totalAmount: totalAmount,
                  discount: discount,
                  amountPaid: amountPaid,
                  settleAmount: settleAmount,
                );

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
