class Result<V> {
  late final bool isSuccess;
  late final V value;
  late final String message;
  late final dynamic failureValue;

  Result.success(this.value) {
    isSuccess = true;
  }

  Result.failure(this.message, [this.failureValue]) {
    isSuccess = false;
  }

  @override
  String toString() {
    if (isSuccess) {
      return 'Result{isSuccess: $isSuccess, value: ${value.toString()}';
    } else {
      return 'Result{isSuccess: $isSuccess, message: $message}';
    }
  }
}