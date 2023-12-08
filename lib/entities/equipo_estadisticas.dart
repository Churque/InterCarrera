class EquipoEstadisticas {
  int pts;
  int pj;
  int pg;
  int pe;
  int pp;
  String difGoles;

  EquipoEstadisticas({
    required this.pts,
    required this.pj,
    required this.pg,
    required this.pe,
    required this.pp,
    required this.difGoles,
  });

  void actualizarEstadisticas(
      {required int goles, required int golesRecibidos}) {
    pj += 1;
    pg += goles > golesRecibidos ? 1 : 0;
    pe += goles == golesRecibidos ? 1 : 0;
    pp += goles < golesRecibidos ? 1 : 0;
    difGoles = (goles - golesRecibidos).toString();

    pts = pg * 3 + pe;

    print(toList());
  }

  List<Object> toList() {
    return [pts, pj, pg, pe, pp, difGoles];
  }
}
