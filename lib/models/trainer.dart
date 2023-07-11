class Trainer {
  final String id;
  final String name;
  final String mobileNumber;

  Trainer({
    required this.id,
    required this.name,
    required this.mobileNumber,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      id: json['id'],
      name: json['name'],
      mobileNumber: json['mobileNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobileNumber': mobileNumber,
    };
  }
}
