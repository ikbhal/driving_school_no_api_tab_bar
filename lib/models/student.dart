class Student {
  final String id;
  final String name;
  final String mobileNumber;
  final String applicationNumber;
  final String course;
  final int trainingDays;
  final double totalAmount;
  final double discount;
  final double amountPaid;
  final double settleAmount;

  Student({
    required this.id,
    required this.name,
    required this.mobileNumber,
    required this.applicationNumber,
    required this.course,
    required this.trainingDays,
    required this.totalAmount,
    required this.discount,
    required this.amountPaid,
    required this.settleAmount,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      mobileNumber: json['mobileNumber'],
      applicationNumber: json['applicationNumber'],
      course: json['course'],
      trainingDays: json['trainingDays'],
      totalAmount: json['totalAmount'],
      discount: json['discount'],
      amountPaid: json['amountPaid'],
      settleAmount: json['settleAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobileNumber': mobileNumber,
      'applicationNumber': applicationNumber,
      'course': course,
      'trainingDays': trainingDays,
      'totalAmount': totalAmount,
      'discount': discount,
      'amountPaid': amountPaid,
      'settleAmount': settleAmount,
    };
  }
}
