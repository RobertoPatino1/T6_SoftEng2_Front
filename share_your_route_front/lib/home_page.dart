import 'package:flutter/material.dart';
import 'package:share_your_route_front/core/utils/jsonConverters/tourist_route_json_converter.dart';
import 'package:share_your_route_front/models/tourist_route.dart';
import 'package:share_your_route_front/modules/home/route_creation.dart/presenters/createRoute2.dart';
import 'package:share_your_route_front/modules/shared/builders/route_card_builder.dart';
import 'package:share_your_route_front/modules/shared/providers/tourist_route_provider.dart';

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
  late TouristRouteService _touristRouteService;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _touristRouteService = TouristRouteService();
    // Add listener to currentTouristRouteNotifier
    _touristRouteService.currentTouristRouteNotifier
        .addListener(_onTouristRouteChange);
  }

  @override
  void dispose() {
    // Remove listener when not needed
    _touristRouteService.currentTouristRouteNotifier
        .removeListener(_onTouristRouteChange);
    super.dispose();
  }

  // Listener function to update UI when tourist route changes
  void _onTouristRouteChange() {
    setState(() {
      // Update UI based on new tourist route state
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TouristRoute? currentRoute =
        _touristRouteService.getCurrentTouristRoute();

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
            icon: const Icon(
              Icons.explore_outlined,
              size: 20,
              color: Colors.grey,
            ),
            label: 'Explorar',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.notifications,
              size: 20,
              color: theme.colorScheme.primary,
            ),
            icon: const Icon(
              Icons.notifications_outlined,
              size: 20,
              color: Colors.grey,
            ),
            label: 'Notificaciones',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(Icons.person, size: 20, color: theme.colorScheme.primary),
            icon: const Icon(Icons.person, size: 20, color: Colors.grey),
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
              if (currentRoute == null) ...[
                Container(
                  margin: const EdgeInsets.only(
                    top: 50,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    "Es hora de una nueva aventura!",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    "¿Deseas crear una ruta?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateRoute2()),
                    );
                  },
                  child: const IntrinsicWidth(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
                      ),
                    ),
                  ),
                ),
              ] else ...[
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ruta en curso: \n${currentRoute.name}",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const BlinkingDot(),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                      color: const Color.fromRGBO(191, 141, 48, 1),
                      margin: const EdgeInsets.only(
                        right: 5,
                      ),
                    ),
                    Text(
                      "Rutas privadas",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RouteCardBuilder().buildRouteCard(
                  context,
                  listFromJson(
                    getPrivateRoutes(),
                  ), // Replace with your data source
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                      color: const Color.fromRGBO(191, 141, 48, 1),
                      margin: const EdgeInsets.only(
                        right: 5,
                      ),
                    ),
                    Text(
                      "Rutas públicas",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RouteCardBuilder().buildRouteCard(
                  context,
                  listFromJson(
                    getPublicRoutes(),
                  ), // Replace with your data source
                ),
              ),
            ],
          ),

          // Messages page
          Container(
            alignment: Alignment.center,
            child: Text(
              "Muy pronto!!!",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),

          //Profile page
          Container(
            alignment: Alignment.center,
            child: Text(
              "Muy pronto!!!",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}

class BlinkingDot extends StatefulWidget {
  const BlinkingDot({super.key});

  @override
  _BlinkingDotState createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<BlinkingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
