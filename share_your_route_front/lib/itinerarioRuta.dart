import 'package:flutter/material.dart';

class ItinerarioRuta extends StatelessWidget {
  const ItinerarioRuta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Cotopaxi: Belleza Natural'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'asset/images/cotopaxi.jpg', // Verifica que esta ruta sea correcta y que la imagen exista
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Icon(Icons.public),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Itinerario de rutas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ItineraryItem(time: '9:00 AM', description: 'Chuquiragua Lodge'),
              ItineraryItem(time: '11:00 AM', description: 'Laguna de Limpiopungo'),
              ItineraryItem(time: '1:00 PM', description: 'Museo de Arte Moderno'),
              ItineraryItem(time: '3:00 PM', description: 'Refugio José Rivas'),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  '20 de enero del 2024',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Paquete completo:',
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '\$75',
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '\$45',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(37, 60, 89, 1),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Acción para comprar el paquete
                  },
                  child: const Text(
                    'Comprar paquete',
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
      color: Colors.blue[200],  // Cambia este color según el tono exacto de azul que necesites
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            time,
            style: const TextStyle(fontSize: 16, color: Colors.white),  // Cambia el color del texto si es necesario
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.white),  // Cambia el color del texto si es necesario
            ),
          ),
        ],
      ),
    );
  }
}
