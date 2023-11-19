class EquipoEstadisticas {
  final int pts;
  final int pj;
  final int pg;
  final int pe;
  final int pp;
  final String difGoles;

  EquipoEstadisticas({
    required this.pts,
    required this.pj,
    required this.pg,
    required this.pe,
    required this.pp,
    required this.difGoles,
  });

  List<Object> toList() {
    return [pts, pj, pg, pe, pp, difGoles];
  }
}
