import 'package:flutter/material.dart';
import 'package:kpler_map_demo/blocs/map_bloc/map_bloc.dart';
import 'package:kpler_map_demo/country_api/models/country_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCard extends StatelessWidget {

  final Country country;
  final ScrollController scrollController;

  const CountryCard({Key? key, required this.country, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {scrollController.animateTo(0.15, duration: const Duration(milliseconds: 500), curve: Curves.easeOutBack);
          DraggableScrollableActuator.reset(context);
          context.read<MapCubit>().selectCountry(country);
        },
        child: SizedBox(height: 50, child: Card(child: Text(country.name!.common!))));
  }
}
