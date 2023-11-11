import 'package:api_client/api_client.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mobile/app.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:models/models.dart';
import 'package:schedule_repository/schedule_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru_RU');

  final apiClient = ApiClient();
  final authenticationRepository = AuthenticationRepository(apiClient);
  final scheduleRepository = ScheduleRepository(apiClient);

  try {
    User? user = await apiClient.auth('123', '1');
    await apiClient.getIntervalSchedule(
        DateTime.utc(2023, 11, 1), DateTime.now(), user!.id);
    //await apiClient.getDailySchedule(DateTime.now(), user!.id);
  } on DioException catch (e) {
    print(e.error);
    print(e.message);
    print(e.response!.data);
    print(e.type);
    print(e.stackTrace);
  }

  List<SvgAssetLoader> loaders = [];
  loaders.add(SvgAssetLoader(MyAssets.images.community.path));
  loaders.add(SvgAssetLoader(MyAssets.images.communityOn.path));
  loaders.add(SvgAssetLoader(MyAssets.images.schedule.path));
  loaders.add(SvgAssetLoader(MyAssets.images.scheduleOn.path));
  loaders.add(SvgAssetLoader(MyAssets.images.profile.path));
  loaders.add(SvgAssetLoader(MyAssets.images.profileOn.path));
  loaders.add(SvgAssetLoader(MyAssets.images.task.path));
  loaders.add(SvgAssetLoader(MyAssets.images.taskOn.path));
  loaders.add(SvgAssetLoader(MyAssets.images.communityClock.path));
  loaders.add(SvgAssetLoader(MyAssets.images.loginHeader.path));
  loaders.add(SvgAssetLoader(MyAssets.images.biometry.path));
  for (int i = 0; i < loaders.length; ++i) {
    svg.cache.putIfAbsent(
        loaders[i].cacheKey(null), () => loaders[i].loadBytes(null));
  }

  runApp(App(
    authenticationRepository: authenticationRepository,
    scheduleRepository: scheduleRepository,
  ));
}
