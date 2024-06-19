// ignore_for_file: use_super_parameters, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:share_your_route_front/models/place.dart';
import 'package:share_your_route_front/models/tourist_route.dart';
import 'package:share_your_route_front/modules/shared/helpers/route_type_helper.dart';

class RouteItineraryPage extends StatelessWidget {
  final TouristRoute touristRoute;
  const RouteItineraryPage({Key? key, required this.touristRoute})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        title: Text(touristRoute.name,
            style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage(
                              "asset/images/${touristRoute.image}.jpg"),
                          fit: BoxFit.cover,
                        ))),
              ),
              const SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: touristRoute.routeType.map((routeType) {
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Icon(
                        RouteTypeHelper.getIconData(routeType),
                        size: 30.0,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              Text('Itinerario de rutas',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 10),
              // ignore: sized_box_for_whitespace
              Container(
                height: 200,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: touristRoute.placesList.length,
                    itemBuilder: (context, index) {
                      Place place = touristRoute.placesList[index].keys.first;
                      String startTime = DateFormat('HH:mm')
                          .format(touristRoute.placesList[index].values.first);
                      return SizedBox(
                        width: 100,
                        height: 50,
                        child: ItineraryItem(
                            time: startTime, description: place.name),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(DateFormat('d-m-y').format(touristRoute.startTime),
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 37, 60, 89),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Modular.to.pushNamed('/auth/home/room/active',
                        arguments: touristRoute);
                  },
                  child: const Text(
                    'Empezar Ruta',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItineraryItem extends StatelessWidget {
  final String time;
  final String description;

  const ItineraryItem({
    required this.time,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 37, 60, 89),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            time,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
