class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? error;

  ApiResponse({this.success = true, this.data, this.error})
      : assert((success && data != null && error == null) ||
      (!success && data == null && error != null));

  // ApiResponse.common({this.success = true, this.data, this.error});
  //
  // ApiResponse.secure({this.success = true, this.data, this.error})
  //     : assert((success && data != null && error == null) ||
  //           (!success && data == null && error != null));
}
