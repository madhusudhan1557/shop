import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/bloc/login/login_cubit.dart';
import 'package:shop/presentation/router.dart';

import 'bloc/register/register_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [NavigatorObserver()],
        title: 'Flutter Demo',
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
