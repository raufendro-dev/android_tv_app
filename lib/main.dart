import 'package:android_tv_app/config/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Android TV App',
        routerConfig: RouterX().router,
      ),
    );
  }
}
