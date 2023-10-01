class Customer {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final int wallet;

  Customer({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.wallet,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'wallet': wallet,
    };
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      wallet: json['wallet'],
    );
  }
}
