import 'package:flutter/material.dart';
import 'package:share_your_route_front/classes/destinations.dart';

List<Destinations> destinations = [
  Destinations(
      name: "Centro artístico",
      duration: 3,
      description: "Descubre las maravillas artísticas",
      startTime: "12:00"),
  Destinations(
      name: "Fauna silvestre",
      duration: 5,
      description: "Descubre la fauna del lugar",
      startTime: "10:00"),
  Destinations(
      name: "Ruta gastronómica",
      duration: 6,
      description: "Encuentra los mejores platos típicos",
      startTime: "14:00"),
];

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(211, 225, 244, 1),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromRGBO(37, 60, 89, 0.5),
        backgroundColor: const Color.fromRGBO(37, 60, 89, 0.1),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_sharp),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Icon(Icons.messenger_sharp),
            label: 'Messages',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: <Widget>[
          // Home page
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 20),
                child: Text(
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Color.fromRGBO(45, 75, 115, 1),
                        fontWeight: FontWeight.bold,
                        height: 1),
                    "Empecemos una aventura!"),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(45, 75, 115, 1),
                        fontWeight: FontWeight.normal),
                    "¿Deseas crear una ruta?"),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(45, 75, 115, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text(
                          'Empezar una ruta',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 2.1,
                        ),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis
                      .horizontal, // Establece la dirección de desplazamiento horizontal
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    Destinations destination =
                        destinations[index]; // Obtener el destino actual

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        // Envuelve el Container en un Row
                        children: [
                          Container(
                            width: 160,
                            color: Colors.blue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(destination.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text("Duración: ${destination.duration} horas"),
                                Text(destination.description),
                                Text(
                                    "Hora de inicio: ${destination.startTime}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis
                      .horizontal, // Establece la dirección de desplazamiento horizontal
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    Destinations destination =
                        destinations[index]; // Obtener el destino actual

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        // Envuelve el Container en un Row
                        children: [
                          Container(
                            width: 160,
                            color: Colors.blue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(destination.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text("Duración: ${destination.duration} horas"),
                                Text(destination.description),
                                Text(
                                    "Hora de inicio: ${destination.startTime}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Notifications page

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Notification 1'),
                    subtitle: Text('This is a notification'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Notification 2'),
                    subtitle: Text('This is a notification'),
                  ),
                ),
              ],
            ),
          ),
          // Messages page
          ListView.builder(
            reverse: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hello',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hi!',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
