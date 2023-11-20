class Seat {
  final String id;
  final String name;
  final int code;
  final int status;
  String? userPhone;
  String? userID;

  Seat({
    required this.id,
    required this.name,
    required this.code,
    required this.status,
    this.userPhone,
    this.userID,
  });

  Seat.empty()
      : id = '',
        name = '',
        code = 0,
        status = 0,
        userPhone = null,
        userID = null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'status': status,
      'userPhone': userPhone,
      'userID': userID,
    };
  }

  factory Seat.fromJson(Map<String, dynamic> json) {
    return Seat(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      status: json['status'],
      userPhone: json['userPhone'],
      userID: json['userID'],
    );
  }
}
