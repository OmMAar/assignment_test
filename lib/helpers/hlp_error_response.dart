class AppResponse<T> {
  String errorMsg;
  int? errorCode;
  bool? isSuccess;
  T? data;

  AppResponse({this.errorMsg = "", this.errorCode = 0, this.data,this.isSuccess});
}
