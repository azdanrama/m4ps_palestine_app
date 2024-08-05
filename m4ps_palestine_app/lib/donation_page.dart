import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(83, 121, 48, 1),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(232, 234, 237, 1),
        ),
        title: const Text(
          'Donation',
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 20,
            color: Color.fromRGBO(232, 234, 237, 1),
          ),  
        ),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 10/2,
        padding: const EdgeInsets.all(25),
        children: [
          buildClickableRect(
            Uri.parse('https://arab.org/click-to-help/palestine/'),
            'Click to Help (arab.org)',
          ),
          buildClickableRect(
            Uri.parse('https://gazaesims.com'),
            'Donate eSIMs',
          ),
          buildClickableRect(
            Uri.parse('https://docs.google.com/spreadsheets/u/1/d/1vtMLLOzuc6GpkFySyVtKQOY2j-Vvg0UsChMCFst_WLA/htmlview#'),
            'Operation Olive Branch',
          ),
          buildClickableRect(
            Uri.parse('https://docs.google.com/spreadsheets/d/1zWGk3AdXjorgL8PAhSiINJ0jdy9INZzJVngPcSF_Of4/edit?pli=1&gid=0#gid=0'),
            'From 🇮🇩 To 🇵🇸',
          ),
        ],
      ),
    );
  }

  Widget buildClickableRect(Uri url, String label) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 249, 196, 1),
          border: Border.all(
            color: const Color.fromRGBO(83, 121, 48, 1),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(83, 121, 48, 1),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.launch,
                color: Color.fromRGBO(83, 121, 48, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}