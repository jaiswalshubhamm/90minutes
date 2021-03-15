class ApiResponse<T> {
  NetworkStatus status;

  T data;

  String message;

  ApiResponse.loading(this.message) : status = NetworkStatus.LOADING;

  ApiResponse.completed(this.data) : status = NetworkStatus.COMPLETED;

  ApiResponse.error(this.message) : status = NetworkStatus.ERROR;

  @override
  String toString() {
    return "Network Status : $status \n Message : $message \n Data : $data";
  }
}

enum NetworkStatus { LOADING, COMPLETED, ERROR }
