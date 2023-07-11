class DrivingClass {
  final String id;
  final String studentId;
  final String studentName;
  final String trainerId;
  final String trainerName;
  final String date;
  final String startTime;
  final String endTime;

  DrivingClass({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.trainerId,
    required this.trainerName,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory DrivingClass.fromJson(Map<String, dynamic> json) {
    return DrivingClass(
      id: json['id'],
      studentId: json['studentId'],
      studentName: json['studentName'],
      trainerId: json['trainerId'],
      trainerName: json['trainerName'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'trainerId': trainerId,
      'trainerName': trainerName,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}
