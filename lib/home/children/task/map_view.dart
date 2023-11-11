import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapView extends StatefulWidget {
  const MapView(
      {required this.task,
      required this.points,
      required this.drivingSessionResult,
      super.key});

  final Task task;
  final List<PlacemarkMapObject> points;
  final DrivingSessionResult drivingSessionResult;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YandexMap(
      mapObjects: [
        ...widget.points,
        _getDrivingMapLines().first,
      ],
      onMapCreated: (controller) {
        _moveToCurrentLocation(widget.points.first.point);
        mapControllerCompleter.complete(controller);
      },
    );
  }

  List<PolylineMapObject> _getDrivingMapLines() {
    List<PolylineMapObject> drivingMapLines = [];
    for (var element in widget.drivingSessionResult.routes ?? []) {
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
