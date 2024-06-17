import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:share_your_route_front/core/constants/app_regex.dart';
import 'package:share_your_route_front/modules/home/home_page/presenters/home_page.dart';
import 'package:share_your_route_front/modules/auth/login/presenters/login_page.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final passNotifier = ValueNotifier<PasswordStrength?>(null);
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final confirmPassNotifier = ValueNotifier<String?>(null);
  bool showPasswordStrength = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    passNotifier.dispose();
    confirmPassNotifier.dispose();
    super.dispose();
  }

  void _validateConfirmPassword() {
    if (passwordController.text != confirmPasswordController.text) {
      confirmPassNotifier.value = 'Las contraseñas no son iguales';
    } else {
      confirmPassNotifier.value = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset('asset/images/logo.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombres',
                        hintText: 'Elliot Sam',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese sus nombres';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Apellidos',
                        hintText: 'Alderson Sepiol',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese sus apellidos';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'samsepiol@example.com',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su email';
                        }
                        if (!AppRegex.emailRegex.hasMatch(value)) {
                          return 'Por favor ingrese un email válido';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre de usuario',
                        hintText: 'mr_robot007',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su nombre de usuario';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Contraseña',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) {
                        passNotifier.value =
                            PasswordStrength.calculate(text: value);
                        _validateConfirmPassword();
                        setState(() {
                          showPasswordStrength = value.isNotEmpty;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Visibility(
                    visible: showPasswordStrength,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        top: 15,
                      ),
                      child: PasswordStrengthChecker(
                        strength: passNotifier,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15,
                    ),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Confirmar contraseña',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) {
                        _validateConfirmPassword();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor confirme su contraseña';
                        }
                        return null;
                      },
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: confirmPassNotifier,
                    builder: (context, errorMessage, child) {
                      return errorMessage != null
                          ? Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 5,
                              ),
                              child: Text(
                                errorMessage,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )
                          : Container();
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 15,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(37, 60, 89, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            passwordController.text ==
                                confirmPasswordController.text) {
                          Modular.to.pushNamed('/auth/home');
                        }
                      },
                      child: const Text(
                        'Crear cuenta',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 130),
                  TextButton(
                    onPressed: () {
                      Modular.to.navigate('/auth/');
                    },
                    child: const Text(
                      'Ya tienes una cuenta? Inicia sesión aquí',
                      style: TextStyle(
                        color: Color.fromRGBO(37, 60, 89, 1),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
