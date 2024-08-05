import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<Widget> carouselItems = [
  Image.asset('assets/images/learnbds_1.jpg'),
  Image.asset('assets/images/learnbds_2.jpg'),
  Image.asset('assets/images/learnbds_3.jpg'),
  Image.asset('assets/images/learnbds_4.jpg'),
];

class BoycottPage extends StatelessWidget {
  const BoycottPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(83, 121, 48, 1),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(232, 234, 237, 1),
        ),
        title: const Text(
          'BDS Movement',
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 20,
            color: Color.fromRGBO(232, 234, 237, 1),
          ),  
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: SizedBox(
            width: double.infinity,
            child: Text(
              "Learn about the BDS Movement",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(30, 29, 29, 1),
              ),
            ),
            ),
          ),
          CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
              height: 360,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
            ),
          ),
          Expanded(child:
              GridView.count(
              crossAxisCount: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 10/2,
              padding: const EdgeInsets.all(25),
              children: [
                buildClickableRect(
                  Uri.parse('https://www.instagram.com/p/C767pwNiXT7'),
                  'FAQs about the BDS Movement',
                ),
                buildClickableRect(
                  Uri.parse('https://bdsmovement.net'),
                  'BDS Movement’s website',
                ),
                buildClickableRect(
                  Uri.parse('https://www.instagram.com/gerakanbds'),
                  'BDS Indonesia 🇮🇩',
                ),
              ],
            )
          )
        ],
      )
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