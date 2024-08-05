import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveTrackerPage extends StatelessWidget {
  const LiveTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(83, 121, 48, 1),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(232, 234, 237, 1),
        ),
        title: const Text(
          'Live Tracker',
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "UPDATE",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(83, 121, 48, 1),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "04 August 2024",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(143, 143, 143, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Gaza
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: SizedBox(
            width: double.infinity,
            child: Text(
              "Gaza",
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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
            width: double.infinity,
            child: Text(
              "- Killed: at least 39,583 people, including\n"
              "- more than: 15,000 children killed\n"
              "- Injured: more than 91,398 people\n"
              "- Missing: more than 10,000",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(30, 29, 29, 1),
              ),
            ),
            ),
          ),
          // Occupied West Bank
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: SizedBox(
            width: double.infinity,
            child: Text(
              "Occupied West Bank",
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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
            width: double.infinity,
            child: Text(
              "- Killed: at least 605 people, including\n"
              "- more than: 144 children\n"
              "- Injured: more than 5,350",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(30, 29, 29, 1),
              ),
            ),
            ),
          ),
          // Devastation accross Gaza
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: SizedBox(
            width: double.infinity,
            child: Text(
              "Devastation accross Gaza",
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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
            width: double.infinity,
            child: Text(
              "- More than half of Gaza’s homes have been destroyed or\n"
              "   damage\n"
              "- 80% of commercial facilities\n"
              "- 85% of school buildings\n"
              "- 16 out of 35 hospitals are partially functioning\n"
              "- 65% of road networks\n"
              "- 63% of cropland area damaged\n",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(30, 29, 29, 1),
              ),
            ),
            ),
          ),
          // Every hour in Gaza
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
            width: double.infinity,
            child: Text(
              "Every hour in Gaza",
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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
            width: double.infinity,
            child: Text(
              "- 15 people are killed - six are children\n"
              "- 35 people are injured\n"
              "- 42 bombs are dropped\n"
              "- 12 buildings are destroyed\n",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(30, 29, 29, 1),
              ),
            ),
            ),
          ),
          Expanded(
            child: GridView.count(
            crossAxisCount: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 10/2,
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            children: [
              buildClickableRect(
                Uri.parse('https://www.aljazeera.com/news/longform/2023/10/9/israel-hamas-war-in-maps-and-charts-live-tracker'),
                'Source: aljazeera.com',
              ),
            ],
            ),
          )
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