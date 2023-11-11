import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:models/models.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository(this.apiClient);

  final ApiClient apiClient;
  final _controller = StreamController<AuthenticationStatus>();
  late User? user;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    try {
      user = await apiClient.auth(username, password);
      if (user != null) {
        print(user!.fio);
        print(user!.grade);
        print(user!.location);
        print(user!.id);
      }
      _controller.add(AuthenticationStatus.authenticated);
    } on Exception {
      rethrow;
    }
  }

  User? getUser() {
    return user;
  }

  User getEmpty() {
    return const User(
        id: -1,
        fio: 'Не удалось получить данные о пользователе',
        location: 'Краснодар, Красная, д. 139',
        grade: '-');
  }

  void logOut() {
    user = null;
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
