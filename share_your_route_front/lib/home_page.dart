import 'package:flutter/material.dart';
import 'package:share_your_route_front/classes/destinations.dart';
import 'package:share_your_route_front/createRoute2.dart';
import 'package:share_your_route_front/routeItineraryPage.dart';

//Listas de prueba
List<Destinations> publicDestinations = [
  Destinations(
      name: "Centro artístico",
      duration: 3,
      image: "centro_artistico",
      description: "Descubre las maravillas artísticas",
      startTime: "12:00"),
  Destinations(
      name: "Fauna silvestre",
      duration: 5,
      image: "fauna_silvestre",
      description: "Descubre la fauna del lugar",
      startTime: "10:00"),
  Destinations(
      name: "Ruta gastronómica",
      image: "ruta_gastronomica",
      duration: 6,
      description: "Encuentra los mejores platos típicos",
      startTime: "14:00"),
];

List<Destinations> privateDestinations = [
  Destinations(
      name: "Tarde con amigos",
      duration: 3,
      image: "no_image",
      description: "Paseo privado con amigos",
      startTime: "13:00"),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentPageIndex = 0;

  Widget buildRouteCard(
      BuildContext context, List<Destinations> destinationsList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: destinationsList.length,
      itemBuilder: (context, index) {
        Destinations destination = destinationsList[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RouteItineraryPage()),
                  );
                },
                child: Container(
                  width: 160,
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
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
                            width: 160,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "asset/images/${destination.image}.jpg"),
                                  fit: BoxFit.cover,
                                ))),
                      ),
                      Center(
                          child: Text(destination.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color.fromRGBO(37, 60, 89, 1)))),
                      Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Text("${destination.duration.toInt()}H",
                              style: const TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.bold))),
                      Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Text(destination.description,
                              style: const TextStyle(fontSize: 10))),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Text("${destination.startTime}",
                              style: const TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        height: 60,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromRGBO(37, 60, 89, 0),
        backgroundColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.explore,
              size: 20,
              color: Color.fromRGBO(37, 60, 89, 1),
            ),
            icon: Icon(
              Icons.explore_outlined,
              size: 20,
              color: Colors.grey,
            ),
            label: 'Explorar',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications,
                size: 20, color: Color.fromRGBO(37, 60, 89, 1)),
            icon: Icon(Icons.notifications_outlined,
                size: 20, color: Colors.grey),
            label: 'Notificaciones',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person,
                size: 20, color: Color.fromRGBO(37, 60, 89, 1)),
            icon: Icon(Icons.person, size: 20, color: Colors.grey),
            label: 'Perfil',
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
                    top: 50, bottom: 10, left: 10, right: 10),
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
              Expanded(child: buildRouteCard(context, privateDestinations)),
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
              Expanded(child: buildRouteCard(context, publicDestinations)),
            ],
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
