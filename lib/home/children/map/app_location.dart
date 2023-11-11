import 'app_lat_long.dart';

abstract class AppLocation {
  Future<AppLatLong> getCurrentLocation();

  Future<AppLatLong> getCoordsFromAddress(String address);

  Future<bool> requestPermission();

  Future<bool> checkPermission();
}
