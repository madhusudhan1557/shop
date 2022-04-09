import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop/presentation/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyShop(
    router: AppRouter(),
  ));
}

class MyShop extends StatelessWidget {
  const MyShop({Key? key, required this.router}) : super(key: key);
  final AppRouter router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [NavigatorObserver()],
      title: 'Flutter Demo',
      onGenerateRoute: router.generateRoute,
    );
  }
}
