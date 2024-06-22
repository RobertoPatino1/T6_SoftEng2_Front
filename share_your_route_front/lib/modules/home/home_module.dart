import 'package:flutter_modular/flutter_modular.dart';
import 'package:share_your_route_front/modules/home/home_page/presenters/home_page.dart';
import 'package:share_your_route_front/modules/home/route_creation.dart/presenters/createRoute2.dart';
import 'package:share_your_route_front/modules/route_room/route_room_module.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/creation', child: (context) => const CreateRoute2());
    r.module('/room', module: RouteRoomModule());
  }
}