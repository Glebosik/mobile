import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/home/bloc/navigation_bloc.dart';
import 'package:mobile/home/children/widgets/home_bottom_nav_bar.dart';
import 'package:mobile/home/children/widgets/my_appbar.dart';

class CommunityViewFail extends StatelessWidget {
  const CommunityViewFail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Сообщество'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Не удалось получить данные о сообществе'),
            const Text(
              'Проверьте подключение к интернету и попробуйте снова',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<NavigationBloc>().add(FetchAllData());
                },
                child: const Text('Попробовать снова')),
          ],
        )),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
