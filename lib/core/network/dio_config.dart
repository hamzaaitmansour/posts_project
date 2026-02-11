import 'package:dio/dio.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com",
        headers: {"Content-type": "application/json"},
      ),
    );
  }
}
