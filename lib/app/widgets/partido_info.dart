import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/pages/info_partido_view.dart';
import 'package:kdksdkskdxd/app/pages/pages_admin/edit_partido.dart';
import 'package:kdksdkskdxd/app/timermanager.dart';
import 'package:kdksdkskdxd/app/widgets/Estado_Partido.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class PartidoInfo extends StatefulWidget {
  final Partido partido;

  PartidoInfo({required this.partido});

  @override
  _PartidoInfoState createState() => _PartidoInfoState();
}

class _PartidoInfoState extends State<PartidoInfo> {
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyInfoPartidoPage(partido: widget.partido),
          ),
        );
      },
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyEditPartidoPage(partido: widget.partido),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 139,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffcccccc)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildEquipoContainer(widget.partido.local),
            SizedBox(width: 40.5),
            _buildEstadoPartido(widget.partido),
            SizedBox(width: 40.5),
            _buildEquipoContainer(widget.partido.visita),
          ],
        ),
      ),
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

  Widget _buildEquipoContainer(Equipo equipo) {
    return Container(
      //margin: EdgeInsets.only(right: 10),
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(equipo.imagenURL),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            equipo.nombreEquipo,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
