class Trip {
  final String id;
  final String departureDate;
  final String departureLocation;
  final String destinationLocation;
  final String departureTime;
  final String destinationTime;
  final int price;
  final String driverId;
  final String carId;

  Trip({
    required this.id,
    required this.departureDate,
    required this.departureLocation,
    required this.destinationLocation,
    required this.departureTime,
    required this.destinationTime,
    required this.price,
    required this.driverId,
    required this.carId,
  });
  //
  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      departureDate: json['departureDate'],
      departureLocation: json['departureLocation'],
      destinationLocation: json['destinationLocation'],
      departureTime: json['departureTime'],
      destinationTime: json['destinationTime'],
      price: json['price'],
      driverId: json['driverId'],
      carId: json['carId'],
    );
  }
}
