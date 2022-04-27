import 'package:ecom/pages/auth/complete_page/complete_page.dart';
import 'package:ecom/pages/auth/login_success/login_success.dart';
import 'package:flutter/widgets.dart';


final Map<String, WidgetBuilder> routes = {
  // HomePage.routeName: (context) => const HomePage(),
  // HomePage.routeName: (context) => const SigninPage(),
  LoginSuccess.routeName: (context) => const LoginSuccess(),
  CompletePage.routeName: (context) => const CompletePage(),
};