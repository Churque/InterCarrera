import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class MatchInfoRow extends StatelessWidget {
  final Partido partido;

  MatchInfoRow({required this.partido});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _MatchInfoCard(
          image: partido.local.imagenURL,
          teamName: partido.local.nombreEquipo,
        ),
        _MatchTimeAndLocation(
          time: partido.fecha,
          location: partido.cancha,
        ),
        _MatchInfoCard(
          image: partido.visita.imagenURL,
          teamName: partido.visita.nombreEquipo,
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
              fontFamily: 'Urbanist',
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
  final DateTime time;
  final String location;

  _MatchTimeAndLocation({required this.time, required this.location});

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.Hm().format(time);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedTime,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(height: 10),
          Text(
            location,
            style: TextStyle(
              fontFamily: 'Urbanist',
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
