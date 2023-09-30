// Sự kiện đăng nhập

// Trạng thái đăng nhập
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState({required this.errorMessage});
}

class SuccessLoginState extends LoginState {}

//visibility password
enum PasswordVisibilityStatus { visible, hidden }
