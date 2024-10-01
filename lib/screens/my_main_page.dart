import 'package:flutter/material.dart';
import 'package:math_play/screens/clock_app.dart';
import 'package:math_play/screens/my_timer_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  bool interNetAccess = true;
  final Uri toLaunch =
      Uri(scheme: 'https', host: 'bitwisesample.netlify.app', path: '');
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 300,
          ),
          const Center(
            child: Text(
              'Math With Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                shadows: [
                  Shadow(
                      color: Colors.black12,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10.30)
                ],
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(
            height: 75.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyTimerPage()),
                  );
                },
                child: Text(
                  'Go to Timer',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Go to Clock',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyClockPage()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 205,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: Text(
              'Power By:',
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            child: const Text(
              'ByteWise Creator',
              style: TextStyle(color: Colors.black87),
            ),
            onPressed: () {
              _launchUrl(toLaunch);
            },
          ),
        ],
      )),
    );
  }
}
