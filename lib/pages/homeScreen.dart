import 'dart:async';
import 'package:installed_apps/installed_apps.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_clock/one_clock.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var warna = Colors.white;
  var jam = DateTime.now();
  void _updateTime() {
    setState(() {
      jam = DateTime.now();
    });
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) => _updateTime());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       // Image.asset('assets/logo/image.png'),
              //       DigitalClock(
              //           showSeconds: false,
              //           isLive: false,
              //           digitalClockTextColor: Colors.white,
              //           textScaleFactor: 2.5,
              //           datetime: DateTime.now()),
              //       Row(
              //         children: [
              //           InkWell(
              //             onTap: () {},
              //             child: Container(
              //               child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.end,
              //                   children: [
              //                     Text(
              //                       "Selamat datang, Rauf Endro",
              //                       style: TextStyle(
              //                           fontSize: 18, color: Colors.white),
              //                     ),
              //                     Text(
              //                       "No. Kamar 729",
              //                       style: TextStyle(
              //                           fontSize: 15, color: Colors.white),
              //                     ),
              //                   ]),
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 60, top: 20),
              //   child: InkWell(
              //     onTap: () {},
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Icon(Icons.wifi),
              //             SizedBox(
              //               width: 10,
              //             ),
              //             Text(
              //               "Informasi Wifi Pengunjung",
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //         Text("SSID : Hotelku"),
              //         Text("Username : kamar729"),
              //         Text("Password : azHgsko13")
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Text(
                      "Streaming",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.tv_rounded)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        print("pencet");
                        final Uri _url = Uri.parse('nflx://www.netflix.com');
                        // final Uri _url = Uri.parse('https://www.youtube.com/');
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Container(
                        width: 200,
                        height: 100,
                        child: Center(
                            child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/7/7a/Logonetflix.png",
                                width: 100)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2)),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        final Uri _url = Uri.parse('https://www.youtube.com/');
                        if (!await launchUrl(_url)) {
                          throw Exception('Could not launch $_url');
                        }
                      },
                      child: Container(
                        width: 200,
                        height: 100,
                        child: Center(
                            child: Image.network(
                                "http://raufendro-dev.com/gambar/yt.png",
                                width: 100)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2)),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        context.push('/salurantv');
                      },
                      child: Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.live_tv_rounded,
                              size: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Live TV")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 37,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Text(
                      "Room",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.hotel_rounded)
                  ],
                ),
              ),
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
                          onTap: () {
                            context.push('/informasiwifi');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wifi_rounded,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Informasi Wifi")
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context.push('/pelayanankamar');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.room_service_outlined,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Pelayanan Kamar")
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
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.restaurant_rounded,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Pesan Makan")
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
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Status Kamar")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
