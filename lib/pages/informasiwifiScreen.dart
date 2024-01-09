import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class InformasiwifiScreen extends StatefulWidget {
  const InformasiwifiScreen({Key? key}) : super(key: key);

  @override
  _InformasiwifiScreenState createState() => _InformasiwifiScreenState();
}

class _InformasiwifiScreenState extends State<InformasiwifiScreen> {
  var jam = DateTime.now();
  void _updateTime() {
    setState(() {
      jam = DateTime.now();
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) => _updateTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image.asset('assets/logo/image.png'),
            DigitalClock(
                showSeconds: false,
                isLive: false,
                digitalClockTextColor: Colors.white,
                textScaleFactor: 2.5,
                datetime: jam),
            Row(
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Selamat datang, Rauf Endro",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          "No. Kamar 729",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ]),
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                  'http://raufendro-dev.com/gambar/wifi.jpg',
                  width: 250,
                  height: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Instruksi cara menghubungkan: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                        'Hubungkan device dengan wifi "Hotelku" atau dengan cukup scan QR diatas'),
                    Text(
                        "Berikut untuk username dan password untuk menggunakan wifi"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Username : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "kamar729",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Password : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "azHgsko13",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
