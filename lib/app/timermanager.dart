import 'package:flutter/material.dart';
import 'dart:async';

import 'package:kdksdkskdxd/entities/partido.dart';

class TimerManager {
  late Timer _timer;
  late Partido partido;
  late State _state;

  TimerManager(this.partido, this._state);

  Timer startTimer() {
    const oneMinute = Duration(seconds: 5);
    _timer = Timer.periodic(oneMinute, (timer) {
      _state.setState(() {
        partido.live = DateTime.now().isAfter(partido.fecha);
        Duration tiempoTranscurrido = DateTime.now().difference(partido.fecha);
        int minutosTranscurridos = tiempoTranscurrido.inMinutes;

        if (minutosTranscurridos >= 50) {
          partido.live = false;
          partido.finalizado = true;
          timer.cancel();
        }
      });
    });

    return _timer;
  }

  void dispose() {
    _timer.cancel();
  }
}
