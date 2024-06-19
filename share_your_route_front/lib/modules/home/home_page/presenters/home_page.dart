import 'package:flutter/material.dart';
import 'package:share_your_route_front/core/utils/jsonConverters/tourist_route_json_converter.dart';
import 'package:share_your_route_front/modules/home/route_creation.dart/presenters/createRoute2.dart';
import 'package:share_your_route_front/modules/shared/builders/route_card_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromRGBO(37, 60, 89, 0),
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.explore,
              size: 20,
              color: theme.colorScheme.primary,
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
                size: 20, color: theme.colorScheme.primary),
            icon: Icon(Icons.notifications_outlined,
                size: 20, color: Colors.grey),
            label: 'Notificaciones',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(Icons.person, size: 20, color: theme.colorScheme.primary),
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
                child: Text(
                    style: Theme.of(context).textTheme.headlineLarge,
                    "Empecemos una aventura!"),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
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
                child: Text(
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headlineMedium,
                    "Rutas privadas"),
              ),
              Expanded(
                  child: RouteCardBuilder().buildRouteCard(
                      context, listFromJson(getPrivateRoutes()))),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10, left: 10, right: 20),
                child: Text(
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headlineMedium,
                    "Rutas públicas"),
              ),
              Expanded(
                  child: RouteCardBuilder().buildRouteCard(
                      context, listFromJson(getPublicRoutes()))),
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
