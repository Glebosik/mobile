import 'dart:collection';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/home/children/map/app_lat_long.dart';
import 'package:mobile/home/children/map/location_service.dart';
import 'package:models/models.dart';
import 'package:schedule_repository/schedule_repository.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

enum PageStatus { loading, loaded, error }

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  //BottomNavBar
  int currentIndex = 0;

  //For ScheduleView
  List<PlacemarkMapObject> pointsSchedule = [];
  List<DrivingSessionResult> drivingSessionResultsSchedule = [];
  LinkedHashMap<DateTime, List<Task>> calendarEvents = LinkedHashMap();
  List<Task> tasks = [
    Task(
      id: '1',
      date: '2023_11_10',
      type: 1,
      title: 'Доставка карты',
      priority: 'top',
      leadTime: 2,
      level: 'jun',
      point_id: 1,
      point_address: 'ул. им. 40-летия Победы, д. 20/1',
      status: 'in_process',
      start: DateTime.utc(2023, 11, 10, 9),
      end: DateTime.utc(2023, 11, 10, 11),
    )
  ];

  //For TaskView
  LocationService locationService = LocationService(city: 'Краснодар');
  int currentTask = 0;
  List<PlacemarkMapObject> pointsTask = [];
  late DrivingSessionResult drivingSessionResultTask;

  //For CommunityView

  //For ProfileView

  //Repositories
  final ScheduleRepository _scheduleRepository;
  final AuthenticationRepository _authRepository;

  //General
  late User user;

  //Flags
  late PageStatus scheduleStatus;
  late PageStatus taskStatus;
  late PageStatus communityStatus;
  late PageStatus profileStatus;

  //Constructor
  NavigationBloc(
      {required ScheduleRepository scheduleRepository,
      required AuthenticationRepository authRepository})
      : _scheduleRepository = scheduleRepository,
        _authRepository = authRepository,
        super(NavigationInitial()) {
    on<FetchAllData>((event, emit) async {
      user = _authRepository.getUser()!;
      emit(ScheduleLoading(user));
      await _initPermission();
      //Загрузка Schedule
      try {
        scheduleStatus = PageStatus.loading;
        await _updateSchedule();
        scheduleStatus = PageStatus.loaded;
        //Переход на первую страничку
        currentIndex = 0;
        emit(ScheduleLoaded(
            tasks, pointsSchedule, drivingSessionResultsSchedule, user));
      } on Exception {
        scheduleStatus = PageStatus.error;
        emit(ScheduleFail());
      }
      //Загрузка Task
      taskStatus = PageStatus.loading;
      try {
        await _updateTask();
      } on Exception {
        taskStatus = PageStatus.error;
      }
      taskStatus = PageStatus.loaded;
      //Загрузка Community
      communityStatus = PageStatus.loading;
      try {
        await _updateCommunity();
      } on Exception {
        communityStatus = PageStatus.error;
      }
      communityStatus = PageStatus.loaded;
      //Загрузка Profile
      profileStatus = PageStatus.loading;
      try {
        await _updateProfile();
      } on Exception {
        profileStatus = PageStatus.error;
      }
      profileStatus = PageStatus.loaded;
    });
    on<PageTapped>((event, emit) {
      switch (event.index) {
        case 0:
          currentIndex = 0;
          switch (scheduleStatus) {
            case PageStatus.loaded:
              emit(ScheduleLoaded(
                  tasks, pointsSchedule, drivingSessionResultsSchedule, user));
              break;
            case PageStatus.loading:
              emit(ScheduleLoading(user));
              break;
            case PageStatus.error:
              emit(ScheduleFail());
              break;
          }
          break;
        case 1:
          currentIndex = 1;
          switch (taskStatus) {
            case PageStatus.loaded:
              emit(TaskLoaded(
                  tasks[currentTask], pointsTask, drivingSessionResultTask));
              break;
            case PageStatus.loading:
              break;
            case PageStatus.error:
              emit(TaskFail());
              break;
          }
          break;
        case 2:
          currentIndex = 2;
          switch (communityStatus) {
            case PageStatus.loaded:
              emit(CommunityLoaded(user));
              break;
            case PageStatus.loading:
              break;
            case PageStatus.error:
              emit(CommunityFail());
              break;
          }
          break;
        case 3:
          currentIndex = 3;
          switch (profileStatus) {
            case PageStatus.loaded:
              emit(ProfileLoaded(user));
              break;
            case PageStatus.loading:
              break;
            case PageStatus.error:
              emit(ProfileFail());
              break;
          }
          break;
      }
    });
    on<UpdateData>((event, emit) async {
      switch (event.index) {
        case 0:
          currentIndex = 0;
          emit(ScheduleLoading(user));
          await _updateSchedule();
          emit(ScheduleLoaded(
              tasks, pointsSchedule, drivingSessionResultsSchedule, user));
          break;
        case 1:
          currentIndex = 1;
          emit(TaskLoading());
          await _updateTask();
          emit(TaskLoaded(
              tasks[currentTask], pointsTask, drivingSessionResultTask));
          break;
        case 2:
          currentIndex = 2;
          emit(CommunityLoading(user));
          await _updateCommunity();
          emit(CommunityLoaded(user));
          break;
        case 3:
          currentIndex = 3;
          emit(ProfileLoading());
          await _updateProfile();
          emit(ProfileLoaded(user));
          break;
      }
    });
  }

  Future<void> _updateSchedule() async {
    try {
      pointsSchedule.clear();
      drivingSessionResultsSchedule.clear();
      LinkedHashMap<DateTime, List<Task>> events = LinkedHashMap(
        equals: isSameDay,
        hashCode: getHashCode,
      ); //..addAll(map);
      pointsSchedule
          .add(await _fetchAddressLocation('Краснодар, Красная, д. 139'));
      pointsSchedule
          .add(await _fetchAddressLocation('ул. Красноармейская, д. 126'));
      pointsSchedule.add(
          await _fetchAddressLocation('ул. Восточно-Кругликовская, д. 64/2'));
      pointsSchedule.add(await _fetchAddressLocation('ул. Уральская, д. 162'));

      //pointsSchedule.add(await _fetchAddressLocation(user.location));
      //if (tasks.length > 1) {
      //for (int i = 0; i < tasks.length; ++i) {
      //  pointsSchedule
      //      .add(await _fetchAddressLocation(tasks[i].point_address));
      //}
      //}
      for (int i = 1; i < pointsSchedule.length; ++i) {
        drivingSessionResultsSchedule.add(await _getDrivingResultWithSession(
                startPoint: pointsSchedule[i - 1].point,
                endPoint: pointsSchedule[i].point)
            .result);
      }
    } on Exception {
      rethrow;
    }
  }

  Future<void> _updateTask() async {
    try {
      pointsTask.clear();
      pointsTask.add(await _fetchCurrentLocation());
      pointsTask
          .add(await _fetchAddressLocation(tasks[currentTask].point_address));
      drivingSessionResultTask = await _getDrivingResultWithSession(
              startPoint: pointsTask.first.point,
              endPoint: pointsTask.last.point)
          .result;
    } on Exception {
      rethrow;
    }
  }

  Future<void> _updateCommunity() async {
    //TODO: Обновление данных сообщества
  }

  Future<void> _updateProfile() async {
    //TODO: Обновление данных Профиля
  }

  /// Проверка разрешений на доступ к геопозиции пользователя
  Future<void> _initPermission() async {
    if (!await locationService.checkPermission()) {
      await locationService.requestPermission();
    }
    await _fetchCurrentLocation();
  }

  /// Получение текущей геопозиции пользователя
  Future<PlacemarkMapObject> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await locationService.getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    return PlacemarkMapObject(
        mapId: const MapObjectId('You are here'),
        point: Point(latitude: location.lat, longitude: location.long),
        opacity: 1,
        text:
            const PlacemarkText(style: PlacemarkTextStyle(), text: 'Вы здесь'),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 0.15,
            image: BitmapDescriptor.fromAssetImage(
                MyAssets.images.mapPoint.path))));
  }

  /// Получение геопозиции по адресу
  Future<PlacemarkMapObject> _fetchAddressLocation(String address) async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await locationService.getCoordsFromAddress(address);
    } catch (_) {
      location = defLocation;
    }
    return PlacemarkMapObject(
        mapId: MapObjectId(address),
        point: Point(latitude: location.lat, longitude: location.long),
        opacity: 1,
        text: PlacemarkText(style: const PlacemarkTextStyle(), text: address),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 0.15,
            image: BitmapDescriptor.fromAssetImage(
                MyAssets.images.mapPoint.path))));
  }

  // Получение данных о возможных маршрутах
  DrivingResultWithSession _getDrivingResultWithSession({
    required Point startPoint,
    required Point endPoint,
  }) {
    var drivingResultWithSession = YandexDriving.requestRoutes(
      points: [
        RequestPoint(
          point: startPoint,
          requestPointType: RequestPointType.wayPoint, // точка начала маршрута
        ),
        RequestPoint(
          point: endPoint,
          requestPointType: RequestPointType.wayPoint, // точка конца маршрута
        ),
      ],
      drivingOptions: const DrivingOptions(
        initialAzimuth: 0,
        routesCount: 5,
        avoidTolls: true,
        avoidPoorConditions: true,
      ),
    );

    return drivingResultWithSession;
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
