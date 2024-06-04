import 'package:flutter/material.dart';
import 'package:share_your_route_front/classes/destinations.dart';
import 'package:share_your_route_front/createRoute2.dart';
import 'package:share_your_route_front/itinerarioRuta.dart';

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
      backgroundColor: const Color.fromRGBO(211, 225, 244, 1),
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
                margin: const EdgeInsets.only(
                    top: 30, bottom: 10, left: 10, right: 10),
                child: const Text(
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Color.fromRGBO(45, 75, 115, 1),
                        fontWeight: FontWeight.bold,
                        height: 1),
                    "Empecemos una aventura!"),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(45, 75, 115, 1),
                        fontWeight: FontWeight.normal),
                    "¿Deseas crear una ruta?"),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(45, 75, 115, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CreateRoute2()),
                      );
                    },
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
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 10, right: 20),
                child: const Text(
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(45, 75, 115, 1),
                        fontWeight: FontWeight.bold,
                        height: 1),
                    "Rutas privadas"),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    Destinations destination = destinations[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ItinerarioRuta()),
                              );
                            },
                            child: Container(
                              width: 160,
                              margin:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 100,
                                      child: Image.asset(
                                          'asset/images/paisaje.jpg'),
                                    ),
                                  ),
                                  Text(destination.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  Text("${destination.duration} H",
                                      style: const TextStyle(fontSize: 10)),
                                  Text(destination.description,
                                      style: const TextStyle(fontSize: 13)),
                                  Text("${destination.startTime}",
                                      style: const TextStyle(fontSize: 10))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10, left: 10, right: 20),
                child: const Text(
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(45, 75, 115, 1),
                        fontWeight: FontWeight.bold,
                        height: 1),
                    "Rutas públicas"),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    Destinations destination = destinations[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Container(
                            width: 160,
                            margin: EdgeInsets.only(top: 12, bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 100,
                                    child: Image.asset(
                                        'asset/images/paisaje.jpg',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Text(destination.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                Text("${destination.duration} H",
                                    style: const TextStyle(fontSize: 10)),
                                Text(destination.description,
                                    style: const TextStyle(fontSize: 13)),
                                Text("${destination.startTime}",
                                    style: const TextStyle(fontSize: 10))
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
