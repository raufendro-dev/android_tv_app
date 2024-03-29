import 'package:android_tv_app/pages/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  cek() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    // context.push('/home');
  }

  @override
  void initState() {
    super.initState();
    cek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset('assets/logo/logo.png'),
    ));
  }
}
