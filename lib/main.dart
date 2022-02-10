import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kpler_map_demo/widgets/country_card.dart';
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
  late ScrollController scrollController;
  LocationData? locationData;
  var isLight = true;

  @override
  initState() {
    super.initState();
    scrollController = ScrollController();
  }

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: const Text("Style loaded :)"),
    //   backgroundColor: Theme.of(context).primaryColor,
    //   duration: const Duration(seconds: 1),
    // ));
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
            body: Stack(children: [
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
          DraggableScrollableSheet(
              expand: true,
              snap: true,
              initialChildSize: 0.3,
              minChildSize: 0.15,
              maxChildSize: 0.5,
              builder: (scrollContext, scrollController) {
                return Card(
                  elevation: 8,
                  color: Colors.grey,
                  child: BlocBuilder<MapCubit, MapState>(
                      builder: (context, state) {
                    return state.countries.isEmpty
                        ? const SizedBox(
                            height: 50, child: CircularProgressIndicator())
                        : ListView.builder(
                            controller: scrollController,
                            itemCount: state.countries.length,
                            itemBuilder: (context, index) {
                              return CountryCard(
                                country: state.countries[index],
                                scrollController: scrollController,
                              );
                            });
                  }),
                );
              }),
        ])));
  }
}
