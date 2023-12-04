import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/timermanager.dart';
import 'package:kdksdkskdxd/app/widgets/Estado_Partido.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class MatchInfoRow extends StatefulWidget {
  final Partido partido;

  MatchInfoRow({required this.partido});

  @override
  _MatchInfoRowState createState() => _MatchInfoRowState();
}

class _MatchInfoRowState extends State<MatchInfoRow> {
  late TimerManager _timerManager;

  @override
  void initState() {
    super.initState();
    _timerManager = TimerManager(widget.partido, this);
    _timerManager.startTimer();
  }

  @override
  void dispose() {
    _timerManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _MatchInfoCard(
          image: widget.partido.local.imagenURL,
          teamName: widget.partido.local.nombreEquipo,
        ),
        _buildEstadoPartido(widget.partido),
        _MatchInfoCard(
          image: widget.partido.visita.imagenURL,
          teamName: widget.partido.visita.nombreEquipo,
        ),
      ],
    );
  }

  Widget _buildEstadoPartido(Partido partido) {
    if (partido.finalizado) {
      return PartidoWidgets.buildPartidoFinalizado(partido);
    } else if (partido.live) {
      return PartidoWidgets.buildPartidoEnVivo(partido);
    } else {
      return PartidoWidgets.buildHoraCanchaContainer(
          partido.fecha, partido.cancha);
    }
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
