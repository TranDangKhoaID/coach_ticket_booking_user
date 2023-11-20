class TopUp {
  String id;
  String idUser;
  String phoneUser;
  int money;
  String paymentMethod;
  String accountNumber;
  String accountOwner;
  String payContent;
  String creatAt;
  int status;

  TopUp({
    required this.id,
    required this.idUser,
    required this.phoneUser,
    required this.money,
    required this.paymentMethod,
    required this.accountNumber,
    required this.accountOwner,
    required this.payContent,
    required this.creatAt,
    required this.status,
  });

  // Phương thức toJson để mã hóa đối tượng TopUp thành JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idUser': idUser,
      'phoneUser': phoneUser,
      'money': money,
      'paymentMethod': paymentMethod,
      'accountNumber': accountNumber,
      'accountOwner': accountOwner,
      'payContent': payContent,
      'creatAt': creatAt,
      'status': status,
    };
  }

  // Phương thức fromJson để giải mã JSON thành đối tượng TopUp
  factory TopUp.fromJson(Map<String, dynamic> json) {
    return TopUp(
      id: json['id'],
      idUser: json['idUser'],
      phoneUser: json['phoneUser'],
      money: json['money'],
      paymentMethod: json['paymentMethod'],
      accountNumber: json['accountNumber'],
      accountOwner: json['accountOwner'],
      payContent: json['payContent'],
      creatAt: json['creatAt'],
      status: json['status'],
    );
  }
}
