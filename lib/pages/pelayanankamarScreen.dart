import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class PelayanankamarScreen extends StatefulWidget {
  const PelayanankamarScreen({Key? key}) : super(key: key);

  @override
  _PelayanankamarScreenState createState() => _PelayanankamarScreenState();
}

class _PelayanankamarScreenState extends State<PelayanankamarScreen> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            child: GridView(
                // scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call_rounded,
                              size: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Hubungi Resepsionis",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cleaning_services_rounded,
                              size: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Cleaning Services")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_laundry_service,
                              size: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Layanan Laundry")
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          )
        ],
      )),
    );
  }
}
