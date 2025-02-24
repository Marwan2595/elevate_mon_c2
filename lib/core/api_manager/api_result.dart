sealed class ApiResult<T> {}

class ApiSuccessResult<T> extends ApiResult<T> {
  T data;
  ApiSuccessResult(this.data);
}

class ApiErrorResult<T> extends ApiResult<T> {
  String exception;
  ApiErrorResult(this.exception);
}

// class StreamApiResult<T> extends ApiResult<T> {
//   Stream stream;
//   StreamApiResult(this.stream);
// }
