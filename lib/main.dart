import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

void main() {
  runApp(const MaterialApp(home: WorldMap()));
}

class WorldMap extends StatefulWidget {
  const WorldMap({Key? key}) : super(key: key);

  @override
  State createState() => WorldMapState();
}

class WorldMapState extends State<WorldMap> {
  MapboxMapController? mapController;
  LocationData? locationData;
  var isLight = true;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
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
    setState(() {
      locationData = _locationData;
      mapController?.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(locationData?.latitude ?? 0, locationData?.longitude ?? 0,), zoom: 6)));
    });
  }

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Style loaded :)"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    const String accessToken = 'pk.eyJ1Ijoia3Jpc3RvcGhlcmxlbGFuZGdtYWlsY29tIiwiYSI6ImNremZ6MGx1cjNtZ3cydnA0eGUxZHhoZTUifQ.Gkkdu9gfQkgSfpC2QvZ7kw';
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(32.0),
          child: FloatingActionButton(
            child: const Icon(Icons.swap_horiz),
            onPressed: () => setState(
                  () => isLight = !isLight,
            ),
          ),
        ),
        body: MapboxMap(
          styleString: isLight ? MapboxStyles.LIGHT : MapboxStyles.DARK,
          accessToken: accessToken,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(zoom: locationData != null ? 6.0 : 0.0, target: LatLng(locationData?.latitude ?? 0, locationData?.longitude ?? 0,)),
          onStyleLoadedCallback: _onStyleLoadedCallback,
        ));
  }
}
