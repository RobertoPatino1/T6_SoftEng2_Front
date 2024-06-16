import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_your_route_front/models/place.dart';
import 'package:share_your_route_front/models/tourist_route.dart';
import 'package:share_your_route_front/modules/home/route_creation.dart/presenters/createRoute2.dart';
import 'package:share_your_route_front/core/constants/route_type.dart';
import 'package:share_your_route_front/modules/route_room/route_preview/presenters/route_preview_page.dart';
import 'package:share_your_route_front/modules/shared/helpers/route_type_helper.dart';

//Listas de prueba
List<Map<Place, DateTime>> places = [
  {Place(name: "Lugar1", entryPrice: 0.0): DateTime(2023, 6, 9, 10, 30)},
  {Place(name: "Lugar2", entryPrice: 0.0): DateTime(2023, 6, 9, 11, 00)},
  {Place(name: "Lugar3", entryPrice: 0.0): DateTime(2023, 6, 9, 11, 30)},
  {Place(name: "Lugar4", entryPrice: 0.0): DateTime(2023, 6, 9, 12, 00)},
  {Place(name: "Lugar5", entryPrice: 0.0): DateTime(2023, 6, 9, 12, 15)}
];

List<TouristRoute> publicRoutes = [
  TouristRoute(
      name: "Centro artístico",
      placesList: places,
      startTime: DateTime(2023, 6, 9, 10, 30),
      endTime: DateTime(2023, 6, 9, 12, 30),
      image: "centro_artistico",
      description: "Descubre las maravillas artísticas",
      hasStarted: false,
      routeType: [RouteType.culture, RouteType.city]),
  TouristRoute(
      name: "Fauna silvestre",
      placesList: places,
      startTime: DateTime(2023, 6, 9, 10, 30),
      endTime: DateTime(2023, 6, 9, 12, 30),
      image: "fauna_silvestre",
      description: "Descubre la fauna del lugar",
      hasStarted: false,
      routeType: [RouteType.nature]),
  TouristRoute(
      name: "Ruta gastronómica",
      image: "ruta_gastronomica",
      placesList: places,
      startTime: DateTime(2023, 6, 9, 10, 30),
      endTime: DateTime(2023, 6, 9, 12, 30),
      description: "Encuentra los mejores platos típicos",
      hasStarted: false,
      routeType: [RouteType.gastronomic, RouteType.city]),
];

List<TouristRoute> privateRoutes = [
  TouristRoute(
      name: "Tarde con amigos",
      placesList: places,
      startTime: DateTime(2023, 6, 9, 10, 30),
      endTime: DateTime(2023, 6, 9, 12, 30),
      image: "no_image",
      description: "Paseo privado con amigos",
      hasStarted: false,
      routeType: [RouteType.gastronomic, RouteType.adventure, RouteType.city]),
];

String formatDuration(Duration duration) {
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);
  return '$hours horas y $minutes minutos';
}

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

  Widget buildRouteCard(BuildContext context, List<TouristRoute> routesList) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: routesList.length,
      itemBuilder: (context, index) {
        TouristRoute touristRoute = routesList[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => RouteItineraryPage(
                              touristRoute: touristRoute,
                            )),
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
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "asset/images/${touristRoute.image}.jpg"),
                                  fit: BoxFit.cover,
                                ))),
                      ),
                      Center(
                          child: Text(touristRoute.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color.fromRGBO(37, 60, 89, 1)))),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: touristRoute.routeType.map((routeType) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                RouteTypeHelper.getIconData(routeType),
                                size: 20.0,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Text(
                              "${DateFormat('HH:mm').format(touristRoute.startTime)}H",
                              style: const TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.bold))),
                      Container(
                        height: 20,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            touristRoute.description,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                              formatDuration(touristRoute.endTime
                                  .difference(touristRoute.startTime)),
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
                        MaterialPageRoute(builder: (_) => const CreateRoute2()),
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
              Expanded(child: buildRouteCard(context, privateRoutes)),
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
              Expanded(child: buildRouteCard(context, publicRoutes)),
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
