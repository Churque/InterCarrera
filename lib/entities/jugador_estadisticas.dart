class JugadorEstadisticas {
  int goles;
  int asistencias;

  JugadorEstadisticas({
    required this.goles,
    required this.asistencias,
  });

  void actualizarGoles({required int goles}) {
    print("Actualizando estadísticas: Goles=$goles");
    this.goles += goles;
    print("Nuevas estadísticas: Goles=${this.goles}");
  }

  void actualizarasistencias({required int asistencias}) {
    print("Actualizando estadísticas: asistencias=$asistencias");
    this.asistencias += asistencias;
    print("Nuevas estadísticas: asistencias=${this.asistencias}");
  }

  factory JugadorEstadisticas.fromMap(Map<String, dynamic> map) {
    return JugadorEstadisticas(
      goles: map['goles'],
      asistencias: map['asistencias'],
    );
  }
}
