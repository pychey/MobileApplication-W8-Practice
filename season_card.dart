import 'package:flutter/material.dart';

enum Season {
  winter('images/seasons/winter.png'),
  spring('images/seasons/spring.png'),
  summer('images/seasons/summer.png'),
  fall('images/seasons/fall.png');

  final String image;

  const Season(this.image);
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SEASONS', style: TextStyle(fontWeight: FontWeight.bold))),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SeasonCard(countryName: 'France', initialSeason: Season.winter),
            SeasonCard(countryName: 'Cambodia', initialSeason: Season.spring),
          ],
        ),
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  const SeasonCard({
    super.key, 
    required this.countryName, 
    required this.initialSeason,
  });

  final String countryName;
  final Season initialSeason;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late Season currentSeason = widget.initialSeason;

  void displayNextSeason() {
    setState(() {
      switch (currentSeason) {
        case Season.winter:
          currentSeason = Season.spring;
          break;
        case Season.spring:
          currentSeason = Season.summer;
          break;
        case Season.summer:
          currentSeason = Season.fall;
          break;
        case Season.fall:
          currentSeason = Season.winter;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2)
      ),
      height: 400,
      child: Column(
        children: [
          GestureDetector(
            onTap: displayNextSeason,
            child: Container(
              width: 150, 
              height: 350,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey, width: 2))
              ),
              child: Image.asset(currentSeason.image, fit: BoxFit.cover)
            )
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(widget.countryName, style: TextStyle(fontWeight: FontWeight.bold))
            )
          )
        ],
      ),
    );
  }
}