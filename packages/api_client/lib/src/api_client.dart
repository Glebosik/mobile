import 'package:dio/dio.dart';
import 'package:models/models.dart';

class ApiClient {
  final Dio _dio = Dio();

  final _baseUrl =
      'https://f32c-2a00-1370-817a-44b1-94b-486c-f2a4-9a89.ngrok-free.app';

  Future<User?> auth(String login, String password) async {
    try {
      Response response = await _dio.post('$_baseUrl/authorization', data: {
        "login": login,
        "password": password,
      });
      return User.fromJson(response.data['allowed']);
      //return RoutesData.fromJson(responseData.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
      // return empty Data object if error occurs
      rethrow;
    }
  }

  Future<List<Task>> getDailySchedule(DateTime date, int id) async {
    List<Task> tasks = [];
    try {
      Response response =
          await _dio.post('$_baseUrl/schedule_worker_on_day', data: {
        "date": '${date.year}_${date.month}_${date.day}',
        "worker_id": id,
      });
      print('aallo');
      return tasks;
      //return RoutesData.fromJson(responseData.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
      // return empty Data object if error occurs
      rethrow;
    }
  }

  Future<List<Task>> getIntervalSchedule(
      DateTime dateStart, DateTime dateEnd, int id) async {
    List<Task> tasks = [];
    try {
      Response response =
          await _dio.post('$_baseUrl/schedule_worker_on_interval', data: {
        "start_date": '${dateStart.year}_${dateStart.month}_${dateStart.day}',
        "end_date": '${dateEnd.year}_${dateEnd.month}_${dateEnd.day}',
        "worker_id": 4,
      });
      print('aallo');
      return tasks;
      //return RoutesData.fromJson(responseData.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
      // return empty Data object if error occurs
      rethrow;
    }
  }
}
