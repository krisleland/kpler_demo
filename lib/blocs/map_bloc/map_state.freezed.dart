// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MapStateTearOff {
  const _$MapStateTearOff();

  _MapState call({LatLng latLng = const LatLng(0, 0), double zoom = 0.0}) {
    return _MapState(
      latLng: latLng,
      zoom: zoom,
    );
  }
}

/// @nodoc
const $MapState = _$MapStateTearOff();

/// @nodoc
mixin _$MapState {
  LatLng get latLng => throw _privateConstructorUsedError;
  double get zoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res>;
  $Res call({LatLng latLng, double zoom});
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res> implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  final MapState _value;
  // ignore: unused_field
  final $Res Function(MapState) _then;

  @override
  $Res call({
    Object? latLng = freezed,
    Object? zoom = freezed,
  }) {
    return _then(_value.copyWith(
      latLng: latLng == freezed
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
      zoom: zoom == freezed
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) then) =
      __$MapStateCopyWithImpl<$Res>;
  @override
  $Res call({LatLng latLng, double zoom});
}

/// @nodoc
class __$MapStateCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(_MapState _value, $Res Function(_MapState) _then)
      : super(_value, (v) => _then(v as _MapState));

  @override
  _MapState get _value => super._value as _MapState;

  @override
  $Res call({
    Object? latLng = freezed,
    Object? zoom = freezed,
  }) {
    return _then(_MapState(
      latLng: latLng == freezed
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
      zoom: zoom == freezed
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_MapState implements _MapState {
  _$_MapState({this.latLng = const LatLng(0, 0), this.zoom = 0.0});

  @JsonKey()
  @override
  final LatLng latLng;
  @JsonKey()
  @override
  final double zoom;

  @override
  String toString() {
    return 'MapState(latLng: $latLng, zoom: $zoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapState &&
            const DeepCollectionEquality().equals(other.latLng, latLng) &&
            const DeepCollectionEquality().equals(other.zoom, zoom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latLng),
      const DeepCollectionEquality().hash(zoom));

  @JsonKey(ignore: true)
  @override
  _$MapStateCopyWith<_MapState> get copyWith =>
      __$MapStateCopyWithImpl<_MapState>(this, _$identity);
}

abstract class _MapState implements MapState {
  factory _MapState({LatLng latLng, double zoom}) = _$_MapState;

  @override
  LatLng get latLng;
  @override
  double get zoom;
  @override
  @JsonKey(ignore: true)
  _$MapStateCopyWith<_MapState> get copyWith =>
      throw _privateConstructorUsedError;
}
