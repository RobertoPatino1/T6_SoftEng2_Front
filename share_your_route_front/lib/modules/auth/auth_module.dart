import 'package:flutter_modular/flutter_modular.dart';
import 'package:share_your_route_front/modules/auth/login/presenters/login_page.dart';
import 'package:share_your_route_front/register_page.dart';
import 'package:share_your_route_front/modules/home/home_module.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/register', child: (context) => const Register());
    r.module('/home', module: HomeModule());
  }
}
