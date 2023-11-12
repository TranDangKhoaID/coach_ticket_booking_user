class Seat {
  final String _id;
  final String _name;
  final int _code;
  int _status;
  String? _userPhone;

  Seat.empty()
      : _id = '',
        _name = '',
        _code = 0,
        _status = 0,
        _userPhone = null;
  Seat({
    required String id,
    required String name,
    required int code,
    required int status,
    String? userPhone,
    bool? isOccupied,
  })  : _id = id,
        _name = name,
        _code = code,
        _status = status,
        _userPhone = userPhone;

  String get getId => _id;
  String get getName => _name;
  int get getCode => _code;
  int get getStatus => _status;
  String? get getUserPhone => _userPhone;

  set setStatus(int newStatus) {
    _status = newStatus;
  }

  set setUserPhone(String? newUserPhone) {
    _userPhone = newUserPhone;
  }
}
