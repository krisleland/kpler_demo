import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kpler_map_demo/country_api/country_api_handler.dart';
import 'package:kpler_map_demo/country_api/models/country_models.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'map_bloc.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState(latLng: const LatLng(0, 0), zoom: 0)) {
    _getInitialLocation();
    _getCountryList();
  }

  final countryHandler = CountryAPIHandler();

  //called once in the cubit constructor to get user location to zoom the map
  void _getInitialLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    emit(state.copyWith(latLng: LatLng(_locationData.latitude ?? 0, _locationData.longitude ?? 0), zoom: 6));
  }

  void _getCountryList() async {
    Map<String, Country> countries = await countryHandler.getAll();
    if (countries.isNotEmpty) {
      emit(state.copyWith(countries: countries));
    }
  }

  void updateLocationData(LocationData locationData) {
    emit(state.copyWith(latLng: LatLng(locationData.latitude ?? state.latLng.latitude, locationData.longitude ?? state.latLng.longitude)));
  }

  void selectCountry(Country country) {
    emit(state.copyWith(latLng: LatLng(country.latlng![0], country.latlng![1]), zoom: 4));
  }
}
