import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:kpler_map_demo/country_api/endpoints.dart';
import 'package:kpler_map_demo/models/country_models.dart';

final getIt = GetIt.instance;

class CountryAPIHandler {

  CountryAPIHandler._internal();

  factory CountryAPIHandler() {
    if (!getIt.isRegistered<CountryAPIHandler>()) {
      getIt.registerSingleton<CountryAPIHandler>(CountryAPIHandler._internal());
    }
    return getIt<CountryAPIHandler>();
  }

  Future<List<Country>> getAll() async {
    List<Country> countries = [];
    http.Response resp = await http.get(Uri.parse(allCountriesEndpoint));
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body);
      for (int i = 0; i < data.length; i++) {
        countries.add(Country.fromJson(data[i]));
      }
    }
    return countries;
  }
}