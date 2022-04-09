import 'package:flutter/material.dart';
import 'package:shop/presentation/screens/auth/login.dart';
import 'package:shop/presentation/screens/auth/register.dart';
import 'package:shop/utils/strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginpage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case registerpage:
        return MaterialPageRoute(builder: (_) => RegisterPage());
    }
    return null;
  }
}
