import 'package:flutter/material.dart';
import '../models/student.dart';

class EditStudentScreen extends StatefulWidget {
  final Student student;

  EditStudentScreen({required this.student});

  @override
  _EditStudentScreenState createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  late TextEditingController nameController;
  late TextEditingController mobileNumberController;
  late TextEditingController applicationNumberController;
  late TextEditingController courseController;
  late TextEditingController trainingDaysController;
  late TextEditingController totalAmountController;
  late TextEditingController discountController;
  late TextEditingController amountPaidController;
  late TextEditingController settleAmountController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student.name);
    mobileNumberController =
        TextEditingController(text: widget.student.mobileNumber);
    applicationNumberController =
        TextEditingController(text: widget.student.applicationNumber);
    courseController = TextEditingController(text: widget.student.course);
    trainingDaysController =
        TextEditingController(text: widget.student.trainingDays.toString());
    totalAmountController =
        TextEditingController(text: widget.student.totalAmount.toString());
    discountController =
        TextEditingController(text: widget.student.discount.toString());
    amountPaidController =
        TextEditingController(text: widget.student.amountPaid.toString());
    settleAmountController =
        TextEditingController(text: widget.student.settleAmount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
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

                Student updatedStudent = Student(
                  id: widget.student.id,
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

                Navigator.pop(context, updatedStudent);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
