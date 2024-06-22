import 'package:flutter_modular/flutter_modular.dart';
import 'package:share_your_route_front/modules/route_room/active_route/presenters/map.dart';
import 'package:share_your_route_front/modules/route_room/route_preview/presenters/route_preview_page.dart';

class RouteRoomModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => RouteItineraryPage(),
    );
    r.child(
      '/active',
      child: (context) => MapPage(),
    );
  }
}
