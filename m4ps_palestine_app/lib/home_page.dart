import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:m4ps_palestine_app/info_page.dart';
import 'package:m4ps_palestine_app/donation_page.dart';
import 'package:m4ps_palestine_app/boycott_page.dart';
import 'package:m4ps_palestine_app/live_tracker_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
  void initState() {
    super.initState();
    // Simulate some startup delay
    Future.delayed(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: Stack(
              children: [
                // Palestine Background
                Image.asset(
                  'assets/images/palestine_bg.png',
                  fit: BoxFit.cover,
                  height: 245.0,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 245,
                    decoration: const BoxDecoration(
                      // Gradient
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(255, 249, 196, 1),
                          Color.fromRGBO(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(18),
                    child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Fraunces',
                          color: Color.fromRGBO(83, 121, 48, 1),
                          fontSize: 32,
                        ),
                        children: [
                            TextSpan(text: 'Movement for'),
                            TextSpan(
                              text: '\nPalestine',
                              style: TextStyle(height: 1),
                            ),
                        ],
                      ),
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Grid Button
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.all(25),
              children: [
                gridButton(Icons.help, 'Why we need to\nsupport Palestine?', const InfoPage()),
                gridButton(Icons.volunteer_activism, 'Donation for\nPalestine', const DonationPage()),
                gridButton(Icons.dangerous, 'Palestinian-led\nBoycott (BDS)', const BoycottPage()),
                gridButton(Icons.track_changes, 'Live Tracker\nof Palestine', const LiveTrackerPage()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget gridButton(IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 249, 196, 1),
        border: Border.all(
          color: const Color.fromRGBO(83, 121, 48, 1),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
            color: const Color.fromRGBO(83, 121, 48, 1),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Fraunces',
              fontSize: 16,
              color: Color.fromRGBO(83, 121, 48, 1),
            ),
          ),
        ],
      ),
      ),
    );
  }
}