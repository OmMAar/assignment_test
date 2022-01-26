class AppEndpoints {
  AppEndpoints._();

  // base url
  static const String baseUrl = "https://reqres.in/api";

  // receiveTimeout
  static const int receiveTimeout = 150000;

  // connectTimeout
  static const int connectionTimeout = 300000;



  static const String signIn = '$baseUrl/login';

}