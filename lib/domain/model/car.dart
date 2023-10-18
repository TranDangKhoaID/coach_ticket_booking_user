class Car {
  final String id;
  final String name;
  final String licensePlates;
  String? tripId;

  Car({
    required this.id,
    required this.name,
    required this.licensePlates,
    this.tripId,
  });
  // Phương thức biến đổi từ Map thành Car
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      name: json['name'],
      licensePlates: json['licensePlates'],
      tripId: json['idTrip'],
    );
  }
}
