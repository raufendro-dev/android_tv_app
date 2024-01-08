import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final idpelanggan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Image.asset('assets/logo/logo.png'),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "Silahkan masukan no. id pelanggan anda",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration:
                        new InputDecoration.collapsed(hintText: 'ID Pelanggan'),
                    onSubmitted: (value) {
                      if (idpelanggan.text != null) {
                        context.go('/home');
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
