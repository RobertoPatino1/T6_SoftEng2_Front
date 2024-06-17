import 'package:flutter_modular/flutter_modular.dart';
import 'package:share_your_route_front/modules/auth/login/presenters/login_page.dart';
import 'package:share_your_route_front/modules/auth/register/presenters/register_page.dart';
import 'package:share_your_route_front/modules/home/home_module.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
    r.child('/register', child: (context) => Register());
    r.module('/home', module: HomeModule());
  }
}
