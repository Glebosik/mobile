import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/home/children/widgets/my_appbar.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DailyMapView extends StatefulWidget {
  const DailyMapView(
      {required this.points, required this.drivingSessionResults, super.key});

  final List<PlacemarkMapObject> points;
  final List<DrivingSessionResult> drivingSessionResults;

  @override
  State<DailyMapView> createState() => _DailyMapViewState();
}

class _DailyMapViewState extends State<DailyMapView> {
  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<PolylineMapObject> list = [];
    for (int i = 0; i < widget.drivingSessionResults.length; ++i) {
      list.add(_getDrivingMapLines(widget.drivingSessionResults[i]).first);
    }
    return Scaffold(
      appBar: myAppBar('Маршрут на сегодня',
          padding: const EdgeInsets.only(left: 20)),
      body: YandexMap(
        mapObjects: [
          ...widget.points,
          ...list,
        ],
        onMapCreated: (controller) {
          _moveToCurrentLocation(widget.points.first.point);
          mapControllerCompleter.complete(controller);
        },
      ),
    );
  }

  List<PolylineMapObject> _getDrivingMapLines(
      DrivingSessionResult drivingSessionResult) {
    List<PolylineMapObject> drivingMapLines = [];
    for (var element in drivingSessionResult.routes ?? []) {
      drivingMapLines.add(
        PolylineMapObject(
          mapId: MapObjectId('route $element'),
          polyline: Polyline(points: element.geometry),
          strokeColor:
              // генерируем случайный цвет для каждого маршрута
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
          strokeWidth: 3,
          gapLength: 5,
          dashLength: 15,
        ),
      );
    }
    return drivingMapLines;
  }

  /// Метод для показа текущей позиции
  Future<void> _moveToCurrentLocation(
    Point point,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: point,
          zoom: 12,
        ),
      ),
    );
  }
}
