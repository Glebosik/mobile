import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/authentication/bloc/authentication_bloc.dart';
import 'package:mobile/home/bloc/navigation_bloc.dart';
import 'package:mobile/home/view/home_page.dart';
import 'package:mobile/login/view/login_page.dart';
import 'package:mobile/splash/view/splash_page.dart';
import 'package:mobile/utils/theme.dart';
import 'package:schedule_repository/schedule_repository.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    required ScheduleRepository scheduleRepository,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _scheduleRepository = scheduleRepository;

  final AuthenticationRepository _authenticationRepository;
  final ScheduleRepository _scheduleRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _authenticationRepository),
          RepositoryProvider.value(value: _scheduleRepository),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
            create: ((context) => NavigationBloc(
                  scheduleRepository: _scheduleRepository,
                  authRepository: _authenticationRepository,
                )),
          ),
        ], child: const AppView()));
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
