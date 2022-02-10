import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kpler_map_demo/country_api/models/country_models.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

// part 'map_state.g.dart';
part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  factory MapState({@Default(LatLng(0, 0)) LatLng latLng,@Default(0.0) double zoom, @Default(
      {}) Map<String, Country> countries}) = _MapState;
}
