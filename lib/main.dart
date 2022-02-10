import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'blocs/map_bloc/map_bloc.dart';

void main() {
  runApp(MaterialApp(
      home: BlocProvider(create: (_) => MapCubit(), child: const WorldMap())));
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
    const String accessToken =
        'pk.eyJ1Ijoia3Jpc3RvcGhlcmxlbGFuZGdtYWlsY29tIiwiYSI6ImNremZ6MGx1cjNtZ3cydnA0eGUxZHhoZTUifQ.Gkkdu9gfQkgSfpC2QvZ7kw';
    return BlocListener<MapCubit, MapState>(
        listenWhen: (p, c) {
          if (p.latLng != c.latLng) return true;
          return false;
        },
        listener: (context, state) {
          setState(() {
            mapController?.moveCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    zoom: state.zoom,
                    target: LatLng(
                        state.latLng.latitude, state.latLng.longitude))));
          });
        },
        child: Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(32.0),
              child: FloatingActionButton(
                child: const Icon(Icons.swap_horiz),
                onPressed: () => setState(
                  () => isLight = !isLight,
                ),
              ),
            ),
            body: Column(children: [
              MapboxMap(
                styleString: isLight ? MapboxStyles.LIGHT : MapboxStyles.DARK,
                accessToken: accessToken,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                    zoom: locationData != null ? 6.0 : 0.0,
                    target: LatLng(
                      locationData?.latitude ?? 0,
                      locationData?.longitude ?? 0,
                    )),
                onStyleLoadedCallback: _onStyleLoadedCallback,
              ),
              SizedBox(
                  height: 300,
                  child: BlocBuilder<MapCubit, MapState>(
                      builder: (context, state) {
                    return state.countries.isEmpty
                        ? const CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: state.countries.length,
                            itemBuilder: (context, index) {
                              return Card(child: Text(state.countries[index].name!.common!),);
                            });
                  })),
            ])));
  }
}
