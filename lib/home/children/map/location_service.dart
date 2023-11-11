import 'package:geolocator/geolocator.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

import 'app_lat_long.dart';
import 'app_location.dart';

class LocationService implements AppLocation {
  LocationService({String? city}) : city = city ?? 'Краснодар';
  String city;
  final YandexGeocoder geocoder =
      YandexGeocoder(apiKey: '45bb0d46-af93-4624-aade-f54ac8807b40');
  final defLocation = const MoscowLocation();

  @override
  Future<AppLatLong> getCurrentLocation() async {
    return Geolocator.getCurrentPosition().then((value) {
      return AppLatLong(lat: value.latitude, long: value.longitude);
    }).catchError(
      (_) => defLocation,
    );
  }

  @override
  Future<AppLatLong> getCoordsFromAddress(String address) async {
    final geocodeFromAddress = await geocoder.getGeocode(
        GeocodeRequest(geocode: AddressGeocode(address: '$city, $address')));

    if (geocodeFromAddress.firstPoint != null) {
      return AppLatLong(
          lat: geocodeFromAddress.firstPoint!.latitude,
          long: geocodeFromAddress.firstPoint!.longitude);
    } else {
      return defLocation;
    }
  }

  @override
  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  @override
  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }
}
