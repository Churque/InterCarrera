class HistorialPartidos {
  final String nombreEquipo;
  final String imagenURL;
  final List<ResultadoPartido> resultados;

  HistorialPartidos({
    required this.nombreEquipo,
    required this.imagenURL,
    required this.resultados,
  });
}

class ResultadoPartido {
  final bool gano;
  final bool empate;
  final int golesEquipoLocal;
  final int golesEquipoVisita;

  ResultadoPartido({
    required this.gano,
    required this.empate,
    required this.golesEquipoLocal,
    required this.golesEquipoVisita,
  });
}
