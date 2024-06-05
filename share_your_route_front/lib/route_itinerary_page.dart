import 'package:flutter/material.dart';
import 'package:share_your_route_front/map.dart';

class RouteItineraryPage extends StatelessWidget {
  const RouteItineraryPage({super.key});

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
        title: const Text('Cotopaxi: Belleza Natural',
            style: TextStyle(color: Color.fromRGBO(37, 60, 89, 1))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'asset/images/cotopaxi.jpg', // Ensure the image path is correct
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Icon(Icons.public),
                ],
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
              const ItineraryItem(
                  time: '9:00 AM', description: 'Chuquiragua Lodge'),
              const ItineraryItem(
                  time: '11:00 AM', description: 'Laguna de Limpiopungo'),
              const ItineraryItem(
                  time: '1:00 PM', description: 'Museo de Arte Moderno'),
              const ItineraryItem(
                  time: '3:00 PM', description: 'Refugio José Rivas'),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  '20 de enero del 2024',
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
