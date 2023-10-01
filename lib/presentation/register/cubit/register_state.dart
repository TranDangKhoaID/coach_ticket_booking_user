class RegisterState {
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  RegisterState({
    required this.isSubmitting,
    required this.isSuccess,
    this.errorMessage,
  });

  factory RegisterState.initial() {
    return RegisterState(
      isSubmitting: false,
      isSuccess: false,
      errorMessage: null,
    );
  }

  factory RegisterState.submitting() {
    return RegisterState(
      isSubmitting: true,
      isSuccess: false,
      errorMessage: null,
    );
  }

  factory RegisterState.success() {
    return RegisterState(
      isSubmitting: false,
      isSuccess: true,
      errorMessage: null,
    );
  }

  factory RegisterState.failure(String errorMessage) {
    return RegisterState(
      isSubmitting: false,
      isSuccess: false,
      errorMessage: errorMessage,
    );
  }
}
