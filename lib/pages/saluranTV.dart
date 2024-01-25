import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:url_launcher/url_launcher.dart';

class SaluranTV extends StatefulWidget {
  const SaluranTV({Key? key}) : super(key: key);

  @override
  _SaluranTVState createState() => _SaluranTVState();
}

class _SaluranTVState extends State<SaluranTV> {
  var jam = DateTime.now();
  void _updateTime() {
    setState(() {
      jam = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  InkWell(
                    onTap: () async {
                      final Uri _url =
                          Uri.parse('https://www.vidio.com/live/204-sctv');
                      if (!await launchUrl(_url)) {
                        throw Exception('Could not launch $_url');
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 100,
                      child: Center(
                          child: Image.network(
                              "https://www.sctv.co.id/_nuxt/img/site-logo.43a458b.png",
                              width: 100)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2)),
                    ),
                  ),
                ]),
          )
        ],
      )),
    );
  }
}
