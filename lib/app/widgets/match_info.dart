import 'package:flutter/material.dart';

class MatchInfoRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _MatchInfoCard(
          image:
              'https://assets.stickpng.com/images/584a9b57b080d7616d298779.png',
          teamName: 'VILLAREAL CF',
        ),
        _MatchTimeAndLocation(
          time: '15:00',
          location: 'Cancha N°1',
        ),
        _MatchInfoCard(
          image:
              'https://upload.wikimedia.org/wikipedia/en/7/7a/Girona_FC_new_logo.png',
          teamName: 'GIRONA FC',
        ),
      ],
    );
  }
}

class _MatchInfoCard extends StatelessWidget {
  final String image;
  final String teamName;

  _MatchInfoCard({required this.image, required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 60,
            height: 75,
            child: Image.network(
              image,
              width: 60,
              height: 75,
            ),
          ),
          Text(
            teamName,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchTimeAndLocation extends StatelessWidget {
  final String time;
  final String location;

  _MatchTimeAndLocation({required this.time, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(height: 10),
          Text(
            location,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff015c1a),
            ),
          ),
        ],
      ),
    );
  }
}
