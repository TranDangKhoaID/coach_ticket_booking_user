class Booking {
  final String id;
  final String userId;
  final String userName;
  final String userPhone;
  final String tripId;
  final String seatId;
  final String seatName;
  final int seatCode;
  final int price;
  final String departureLocation;
  final String destinationLocation;
  final String departureDate;
  final String departureTime;
  final int status;
  final String createdAt;

  Booking({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userPhone,
    required this.tripId,
    required this.seatId,
    required this.seatName,
    required this.seatCode,
    required this.price,
    required this.departureLocation,
    required this.destinationLocation,
    required this.departureDate,
    required this.departureTime,
    required this.status,
    required this.createdAt,
  });

  // Convert Booking object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userPhone': userPhone,
      'tripId': tripId,
      'seatId': seatId,
      'seatName': seatName,
      'seatCode': seatCode,
      'price': price,
      'departureLocation': departureLocation,
      'destinationLocation': destinationLocation,
      'departureDate': departureDate,
      'departureTime': departureTime,
      'status': status,
      'createdAt': createdAt,
    };
  }

  // Create a Booking object from a JSON map
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      userPhone: json['userPhone'],
      tripId: json['tripId'],
      seatId: json['seatId'],
      seatName: json['seatName'],
      seatCode: json['seatCode'],
      price: json['price'],
      departureLocation: json['departureLocation'],
      destinationLocation: json['destinationLocation'],
      departureDate: json['departureDate'],
      departureTime: json['departureTime'],
      status: json['status'],
      createdAt: json['createdAt'],
    );
  }
}
