import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_your_route_front/classes/place.dart';
import 'package:share_your_route_front/classes/tourist_route.dart';
import 'package:share_your_route_front/map.dart';
import 'package:share_your_route_front/route_type_helper.dart';

class RouteItineraryPage extends StatelessWidget {
  final TouristRoute route;
  const RouteItineraryPage({Key? key, required this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(route.name,
            style: const TextStyle(
                color: Color.fromRGBO(37, 60, 89, 1),
                fontWeight: FontWeight.bold)),
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage("asset/images/${route.image}.jpg"),
                          fit: BoxFit.cover,
                        ))),
              ),
              const SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: route.routeType.map((routeType) {
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Icon(
                        RouteTypeHelper.getIconData(routeType),
                        size: 30.0, // Set the size of the icon
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Itinerario de rutas',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(37, 60, 89, 1)),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200, // Altura definida del contenedor
                child: SingleChildScrollView(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: route.placesList.length,
                    itemBuilder: (context, index) {
                      Place place = route.placesList[index].keys.first;
                      String startTime = DateFormat('HH:mm')
                          .format(route.placesList[index].values.first);
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
                child: Text(
                  DateFormat('d-m-y').format(route.startTime),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(37, 60, 89, 1)),
                ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MapPage()),
                    );
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
