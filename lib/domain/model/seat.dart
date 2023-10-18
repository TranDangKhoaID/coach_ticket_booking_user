class Seat {
  final String _id;
  final String _name;
  int _status;
  String? _userId;

  Seat.empty()
      : _id = '',
        _name = '',
        _status = 0,
        _userId = null;
  Seat({
    required String id,
    required String name,
    required int status,
    String? userId,
  })  : _id = id,
        _name = name,
        _status = status,
        _userId = userId;

  String get getId => _id;
  String get getName => _name;
  int get getStatus => _status;
  String? get getUserId => _userId;

  set setStatus(int newStatus) {
    _status = newStatus;
  }

  set setUserId(String? newUserId) {
    _userId = newUserId;
  }
}
