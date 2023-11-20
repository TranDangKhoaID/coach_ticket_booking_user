class Location {
  final String id;
  final String name;
  final String address;

  Location({
    required this.id,
    required this.name,
    required this.address,
  });

  // Phương thức biến đổi từ Map thành Location
  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id'],
      name: map['name'],
      address: map['address'],
    );
  }
}
